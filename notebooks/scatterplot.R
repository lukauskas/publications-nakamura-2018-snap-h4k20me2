scatterplot <- function(df_plot,
                        df_plot_plus_fake,
                        limits,
                        ticks,
                        label_column='label_all',
                        alpha=1.0,
                        point_size=7.0,
                        tick_width=2,
                        tick_length_cm=0.5,
                        axes_line_width=2,
                        boxplot_lwd=2,
                        boxplot_width=1.0,
                        boxplot_outlier_size=3.0,
                        line_width=6,
                        repel_segment_size=1.0,
                        box_padding=0.35,
                        point_padding=0.5,
                        base_size=35, label_size=10,
                        use_fake_data=TRUE,
                        force=1,
                        segment_line_color='black',
                        max.iter=3e3,
                        nudge_x=0,
                        nudge_y=0,
                        repel=TRUE
                        ) {

  p <- ggplot(df_plot, aes(x=x,
                       y=y, colour=group))

  p <- p + geom_point(aes(alpha=group), size=point_size, show.legend=FALSE)

  p <- p + geom_vline(xintercept=0, size=axes_line_width, colour=rgb(0,0,0,1))
  p <- p + geom_hline(yintercept=0, size=axes_line_width, colour=rgb(0,0,0,1))

  p <- p + scale_alpha_manual(values=c("Other" = alpha,
                                    "TONSL" = 1.0,
                                    "BRCA1" = 1.0,
                                    "RAD18/SLF" = 1.0,
                                    "ORC" = 1.0))

  if (!is.na(label_size)) {
    if (use_fake_data) {
      repel_data = df_plot_plus_fake
    }
    else {
      repel_data = df_plot
    }

    if (repel) {
      p <- p + geom_text_repel(aes_string(colour='group', label=label_column, fontface='fontface'),
                            box.padding = box_padding, point.padding = point_padding,
                            size = label_size,
                          #  color='black',
                          #  label.size=NA,
                            data=repel_data,
                            show.legend=F,
                            segment.color = segment_line_color,
                            segment.size=repel_segment_size,
                            force=force,
                            max.iter=max.iter,
                            nudge_x=nudge_x,
                            nudge_y=nudge_y
                            )
    }
    else {
      p <- p + geom_text(aes_string(colour='group', label=label_column, fontface='fontface'),
                          size = label_size,
                            show.legend=F,
                            nudge_x=nudge_x,
                            nudge_y=nudge_y
                            )
    }


    # p <- p + scale_fill_manual(values=c("Other" = 'white',
    #                                   "TONSL" = "#66c2a5",
    #                                   "BRCA1" = '#fc8d62',
    #                                   "RAD18/SLF" = '#ffd92f',
    #                                   "ORC" = '#e78ac3',
    #                                   "fake" = NA),
    #                        breaks=c("TONSL", "BRCA1", "RAD18/SLF", "ORC"))
  }

  p <- p + scale_colour_manual(values=c("Other" = 'black',
                                        "TONSL" = "#7570b3",
                                        "BRCA1" = '#d95f02',
                                        "RAD18/SLF" = '#66a61e',
                                        "ORC" = '#e7298a',
                                        "fake" = NA))

  p <- p + scale_x_continuous(limits=limits, expand=c(0,0), breaks=ticks)
  p <- p + scale_y_continuous(limits=limits, expand=c(0,0), breaks=ticks)

  p <- p + labs(x='log2 ratio H4K20me2/H4K20me0 (forward)',
            y='log2 ratio H4K20me0/H4K20me2 (reverse)',
            #title='H4K20me2 nucleosome pull-down',
            fill='')

  # Styling
  p <- p + theme_linedraw(base_size=base_size)
  p <- p + theme_light(base_size=base_size)
  p <- p + theme(plot.title=element_blank(),
                     panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(),
                     panel.border=element_rect(size=line_width,
                                               fill=NULL,
                                               color='black'),
                    #  axis.title = (),
                     axis.text.x = element_text(size=base_size, color='black'),
                     axis.text.y = element_text(size=base_size, color='black'),
                     axis.ticks.x=element_line(color='black', size=tick_width),
                     axis.ticks.length=unit(tick_length_cm, 'cm'),
                     axis.ticks.y=element_line(color='black', size=tick_width),
                     )


  #
  p <- ggExtra::ggMarginal(
  p,
  x=x, y=y,
  type = 'boxplot',
  margins = 'both',
  lwd=boxplot_lwd,
  size = 15,
  width=boxplot_width,
  #   col = '#FF0000',
  fill = NA,
  outlier.size=boxplot_outlier_size,
  )

  p
  # p <- p + theme(plot.margin = grid::unit(c(0, 0, 0, 0), "null"))
}
