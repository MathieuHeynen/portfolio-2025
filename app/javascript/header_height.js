const updateHeaderHeight = () => {
  const header = document.querySelector(".header");
  if (!header) return;

  const height = header.offsetHeight;
  document.documentElement.style.setProperty("--header-height", `${height}px`);

  new ResizeObserver(() => {
    const dynamicHeight = header.offsetHeight;
    document.documentElement.style.setProperty(
      "--header-height",
      `${dynamicHeight}px`
    );
  }).observe(header);
};

document.addEventListener("turbo:load", updateHeaderHeight);
