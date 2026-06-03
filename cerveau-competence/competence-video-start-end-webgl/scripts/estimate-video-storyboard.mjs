import { readFile } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const root = path.resolve(__dirname, "..");
const configPath = path.join(root, "presets.json");

function parseArgs() {
  const args = process.argv.slice(2);
  const read = (key, fallback) => {
    const index = args.indexOf(key);
    return index >= 0 ? args[index + 1] : fallback;
  };
  return {
    sections: Number(read("--sections", "1")),
    complexity: read("--complexity", "medium"),
    preset: read("--preset", "mobile"),
    microClips: Number(read("--micro-clips", "0")),
    json: args.includes("--json")
  };
}

function formatMinutes(minutes) {
  if (minutes < 60) return `${Math.round(minutes)} min`;
  const hours = Math.floor(minutes / 60);
  const rest = Math.round(minutes % 60);
  return rest ? `${hours}h${String(rest).padStart(2, "0")}` : `${hours}h`;
}

function table(rows) {
  const columns = Object.keys(rows[0]);
  const widths = columns.map((col) => Math.max(col.length, ...rows.map((row) => String(row[col]).length)));
  const line = columns.map((col, index) => String(col).padEnd(widths[index])).join(" | ");
  const sep = widths.map((width) => "-".repeat(width)).join("-|-");
  const body = rows.map((row) => columns.map((col, index) => String(row[col]).padEnd(widths[index])).join(" | "));
  return [line, sep, ...body].join("\n");
}

const options = parseArgs();
const config = JSON.parse(await readFile(configPath, "utf8"));
const preset = config.presets[options.preset];
const heuristic = config.keyframeHeuristics[options.complexity];

if (!preset) {
  console.error(`Unknown preset: ${options.preset}`);
  console.error(`Available presets: ${Object.keys(config.presets).join(", ")}`);
  process.exit(1);
}

if (!heuristic && !options.microClips) {
  console.error(`Unknown complexity: ${options.complexity}`);
  console.error(`Available complexities: ${Object.keys(config.keyframeHeuristics).join(", ")}`);
  process.exit(1);
}

const sections = Math.max(1, options.sections || 1);
const microClips = options.microClips > 0 ? options.microClips : sections * heuristic.microClipsPerSection;
const keyframes = options.microClips > 0 ? microClips + sections : sections * heuristic.keyframesPerSection;
const minMinutes = microClips * preset.generationMinutesMin;
const maxMinutes = microClips * preset.generationMinutesMax;
const totalVideoSeconds = microClips * preset.durationSeconds;

const result = {
  sections,
  complexity: options.microClips > 0 ? "manual" : options.complexity,
  preset: options.preset,
  presetLabel: preset.label,
  keyframes,
  microClips,
  settings: {
    frames: preset.frames,
    fps: preset.fps,
    steps: preset.steps,
    cfg: preset.cfg,
    shift: preset.shift,
    durationSecondsPerMicroClip: preset.durationSeconds
  },
  estimate: {
    generationMinutesMin: minMinutes,
    generationMinutesMax: maxMinutes,
    generationHuman: `${formatMinutes(minMinutes)} - ${formatMinutes(maxMinutes)}`,
    totalVideoSeconds
  }
};

if (options.json) {
  console.log(JSON.stringify(result, null, 2));
} else {
  console.log("Competence Video Start/End + WebGL Right Video");
  console.log("");
  console.log(table([
    {
      Sections: result.sections,
      Complexity: result.complexity,
      Preset: result.presetLabel,
      Keyframes: result.keyframes,
      "Micro-clips": result.microClips,
      Settings: `${preset.frames}f/${preset.fps}fps/${preset.steps}steps`,
      "Gen time": result.estimate.generationHuman,
      "Video time": `${result.estimate.totalVideoSeconds.toFixed(2)}s`
    }
  ]));
  console.log("");
  console.log("Preset table:");
  console.log(table(Object.entries(config.presets).map(([key, item], index) => ({
    "#": index + 1,
    Key: key,
    Label: item.label,
    Frames: item.frames,
    FPS: item.fps,
    Steps: item.steps,
    CFG: item.cfg,
    Shift: item.shift,
    Duration: `${item.durationSeconds}s`,
    Time: `${item.generationMinutesMin}-${item.generationMinutesMax} min`
  }))));
}
