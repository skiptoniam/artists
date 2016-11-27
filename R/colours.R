#' Complete list of palettes
#'
#' Use \code{\link{artist_palettes}} to construct palettes of desired length.
#'
#' @name artist_palettes
#' @docType data


#' Famous artist colour palette generator
#'
#' Colour palettes based on famous pieces of art palettes.
#'
#' @param n Number of colours desired. Unfortunately most palettes now only
#'   have 5 colours. But hopefully we'll add more palettes soon. All colour
#'   schemes are derived from the most excellent website:
#'   \href{http://www.colorlisa.com/}{colorlisa}.
#'   If omitted, uses all colours.
#' @param number ID of desired palette (1 to 128)
#' @param see_painting Logical if TRUE R will open a browser with an image of the art work.
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#' @return A vector of colours.
#' @export
#' @keywords colours
#' @examples
#' artist_palette(1, 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- artist_palette(21, number = 2, type = "continuous")
#' image(volcano, col = pal)
artist_palette <- function(number, n, type = c("discrete", "continuous"),see_painting='FALSE') {

  type <- match.arg(type)

  data("artist_palettes")
  tmp <- artist_palettes[[number]]

  if(see_painting==TRUE)browseURL(tmp$painting_url, browser = getOption("browser"),
                                  encodeIfNeeded = FALSE)
  pal <- tmp$palettes#maybe make name
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colours greater than what palette can offer")
  }

  out <- switch(type,
                continuous = colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )

  structure(out, class = "palette", number = number,name=names(artist_palettes)[number])
}

#' @export
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
  cat(paste0(attr(x, "name"),"\n"))
}
