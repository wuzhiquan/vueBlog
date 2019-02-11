/**
 * 路由表配置
 */
export default [
  {
    path: '*',
    redirect: '/welcome'
  },
  {
    path: '/welcome',
    name: 'Welcome',
    component: resolve => require.ensure([], () => resolve(require('@/components/Welcome.vue')), 'Welcome'),
    meta: {
      title: '首页'
    }
  },
  {
    path: '/blog',
    // name: 'Blog',
    component: resolve => require.ensure([], () => resolve(require('@/components/Index.vue')), 'Blog'),
    children: [
      {
        path: '',
        redirect: {
          name: 'BlogList'
        }
      },
      {
        path: 'list', // 注意：这里如果有斜杆，就变成一级地址/#/list，没有就是/#/blog/list
        name: 'BlogList',
        component: resolve => require(['@/components/BlogView/index.vue'], resolve),
        meta: {
          title: '博客列表'
        }
      },
      {
        path: 'detail/:id',
        name: 'BlogDetail',
        component: resolve => require(['@/components/BlogView/detail.vue'], resolve),
        meta: {
          title: '查看文章'
        }
      }
    ]
  },
  {
    path: '/Editor',
    name: 'Editor',
    component: resolve => require.ensure([], () => resolve(require('@/Editor/Index.vue')), 'Editor'),
    meta: {
      title: '发布文章'
    }
  }
]
