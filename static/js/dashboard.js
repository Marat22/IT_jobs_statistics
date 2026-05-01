const grid = document.querySelector(".dashboard-grid");

const palette = {
  green: "#0c6b58",
  orange: "#d97706",
  clay: "#a84c2c",
  moss: "#6f7d3f",
  sand: "#d9b56d",
  line: "#ded7c6",
  ink: "#19211d",
};

function parseSeries(name) {
  if (!grid) {
    return [];
  }

  try {
    return JSON.parse(grid.dataset[name] || "[]");
  } catch {
    return [];
  }
}

function renderChart(canvasId, series, type, colors) {
  const canvas = document.getElementById(canvasId);
  if (!canvas || !series.length || !window.Chart) {
    return;
  }

  new Chart(canvas, {
    type,
    data: {
      labels: series.map((item) => item.label),
      datasets: [
        {
          data: series.map((item) => item.value),
          backgroundColor: colors,
          borderColor: "#fffdf7",
          borderWidth: 2,
          borderRadius: type === "bar" ? 10 : 0,
        },
      ],
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          display: type !== "bar",
          position: "bottom",
          labels: {
            color: palette.ink,
            boxWidth: 12,
          },
        },
      },
      scales:
        type === "bar"
          ? {
              x: {
                grid: { display: false },
                ticks: { color: palette.ink },
              },
              y: {
                beginAtZero: true,
                grid: { color: palette.line },
                ticks: { precision: 0, color: palette.ink },
              },
            }
          : {},
    },
  });
}

renderChart("gradesChart", parseSeries("grades"), "bar", [
  palette.green,
  palette.orange,
  palette.clay,
  palette.moss,
]);

renderChart("experienceChart", parseSeries("experience"), "doughnut", [
  palette.sand,
  palette.green,
  palette.orange,
  palette.clay,
]);

renderChart("workFormatChart", parseSeries("workFormat"), "doughnut", [
  palette.green,
  palette.sand,
  palette.moss,
]);
