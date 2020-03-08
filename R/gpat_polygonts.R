# gpat_ts_polygon = function(input, segments){
#   seg_centr = suppressWarnings(sf::st_coordinates(sf::st_centroid(segments)))
#
#   vx = velox::velox(input)
#   df = vx$extract(segments, fun = function(x){mean(x, na.rm=TRUE)})
#
#   df = cbind(seg_centr, df)
#
#   df = as.data.frame(df)
#   names(df) = c("X", "Y", paste0("X", seq_len(ncol(df) - 2)))
#   df
# }
#
# gpat_ts_distmtx = function(x, signature){
#   seg_centr = x[, c(1, 2)]
#   x = x[, -c(1, 2)]
#
#   x[1] = paste(paste0("[", seg_centr[, 1], ",", seg_centr[, 2],
#                       '] "cat: ', seq_len(nrow(seg_centr)),
#                       '" 1:(', ncol(x), ") =>"),
#                x[, 1])
#
#   tmp_file = tempfile(fileext = ".txt")
#   tmp_file2 = tempfile(fileext = ".txt")
#
#   write.table(x, file = tmp_file, col.names = FALSE, row.names = FALSE, sep = ",", quote = FALSE)
#
#   suppressMessages(system(sprintf("gpat_distmtx -i %s -o %s -m %s",
#                                   tmp_file,
#                                   tmp_file2,
#                                   signature)))
#
#   seg_dist = gpat_read_distmtx(tmp_file2)
#   seg_dist
# }
#
# gpat_ts_predistmtx = function(input, size, signature, ...){
#   vx = velox::velox(input)
#
#   sample_points = st_sample(st_as_sfc(st_bbox(input)), size = size, ...)
#
#   df = na.omit(vx$extract_points(sample_points))
#
#   df = as.data.frame(df)
#   df[1] = paste(paste0("[", 1, ",", 1, '] "cat: ', seq_len(nrow(df)),
#                        '" 1:(', ncol(df), ") =>"),
#                 df[, 1])
#
#   tmp_file = tempfile(fileext = ".txt")
#   tmp_file2 = tempfile(fileext = ".txt")
#
#   write.table(df, tmp_file, col.names = FALSE, row.names = FALSE, sep = ",", quote = FALSE)
#
#   suppressMessages(system(sprintf("gpat_distmtx -i %s -o %s -m %s",
#                                   tmp_file,
#                                   tmp_file2,
#                                   signature)))
#
#   point_dist = gpat_read_distmtx(tmp_file2)
#   point_dist
# }
#
# gpat_ts_norm = function(input, dimension){
#   n_layers = nlayers(input)
#   dim_length = n_layers / dimension
#   seq_n_layers = seq_len(n_layers)
#   ids_list = split(seq_n_layers, ceiling(seq_n_layers / dim_length))
#
#   result = lapply(ids_list, rasterstack_norm, input)
#   result = stack(result)
#   result
# }
#
# rasterstack_norm = function(ids, input){
#   input_part = brick(input[[ids]])
#   mnv = min(cellStats(input_part, "min"))
#   mxv = max(cellStats(input_part, "max"))
#   result_part = (input_part - mnv) / (mxv - mnv)
#   result_part
# }
