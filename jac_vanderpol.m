function res = jac_vanderpol(t,z)

res = [ 0 1; (-2*z(1)*z(2)-1) (-(z(1)^2 - 1)) ];