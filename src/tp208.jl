# TP problem 208 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp208

"Test problem 208 in NLS format"
function tp208()

  nls = Model()
  x0  = [-1.2; 1]
  @variable(nls, x[i=1:2], start=x0[i])

  @NLexpression(nls, F1, 10 * (x[2] - x[1]^2))
  @NLexpression(nls, F2, (1 - x[1]))

  return MathProgNLSModel(nls, [F1; F2], name="tp208")
end