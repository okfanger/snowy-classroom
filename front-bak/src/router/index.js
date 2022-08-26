import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
  {
    path: "",
    name: "Layout",
    component: () => import("@/components/WebLayout"),
    redirect: "/home",
    children: [
      {
        path: "home",
        name: "Home",
        component: () => import("@/views/HomeView"),
      },
    ],
  },
];

const router = new VueRouter({
  routes,
});

export default router;
