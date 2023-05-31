import numpy as np
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt

def runge_kutta(fun, tspan, y0, h):
    n = len(y0)
    t0, t1 = tspan[0], tspan[1]
    iter = int(abs(t1 - t0) / h) + 1
    y = np.zeros((iter + 1, n))
    y[0] = y0
    k = np.zeros((4, n))
    tNow = t0
    t = []
    for i in range(iter):
        t.append(tNow)
        hHalf = h / 2
        k[0] = fun(tNow, y[i])
        k[1] = [fun(tNow + hHalf, y[i] + k[0][j] * hHalf)[j] for j in range(n)]
        k[2] = [fun(tNow + hHalf, y[i] + k[1][j] * hHalf)[j] for j in range(n)]
        k[3] = [fun(tNow + h, y[i] + k[2][j] * h)[j] for j in range(n)]
        y[i + 1] = y[i] + (h / 6) * (k[0] + 2 * k[1] + 2 * k[2] + k[3])
        tNow += h
    return np.array(t), y

def fun(t, y):
    sigma = 10.
    r = 28.
    beta = 8. / 3.
    return [sigma * (y[1] - y[0]), y[0] * (r - y[2]) - y[1], y[0] * y[1] - beta * y[2]]

tspan = np.array([0, 40])
teval = np.linspace(0, 40, 5000)
y0 = np.array([1.0, 1.0, 1.0])

#soln = solve_ivp(fun, tspan, y0, t_eval = teval)
#t = soln.t
#x = soln.y[0]
#y = soln.y[1]
#z = soln.y[2]

t, y = runge_kutta(fun, tspan, y0, 0.01)

fig, ax = plt.subplots(subplot_kw={"projection": "3d"})

#ax.plot(x, y, z)
ax.plot(y[:, 0], y[:, 1], y[:, 2])

#plt.plot(t, x, label='x')
#plt.plot(t, y, label='y')
#plt.plot(t, z, label='z')

plt.show()