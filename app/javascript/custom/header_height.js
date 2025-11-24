const updateHeaderHeight = () => {
  const header = document.querySelector(".header");
  if (!header) return;

  const height = header.offsetHeight;
  document.documentElement.style.setProperty("--header-height", `${height}px`);

  const ro = new ResizeObserver(() => {
    const dynamicHeight = header.offsetHeight;
    document.documentElement.style.setProperty(
      "--header-height",
      `${dynamicHeight}px`
    );
  });
  ro.observe(header);
};

document.addEventListener("turbo:load", updateHeaderHeight);
document.addEventListener("DOMContentLoaded", updateHeaderHeight);
