<template>
  <div>
    <a-list item-layout="horizontal" :data-source="resouList">
      <a-list-item slot="renderItem" slot-scope="item">
        <a-list-item-meta
        >
          <a slot="title" :href="item.url">{{ item.name }} <a-tag color="pink">
            {{ item.hot }}
          </a-tag></a>
        </a-list-item-meta>
      </a-list-item>
    </a-list>
  </div>
</template>

<script>
import { getHotNews } from '@/api/test'
export default {
  name: 'AdminOverall',
  data () {
    return {
      resouList: []
    }
  },
  created () {
    getHotNews().then((res) => {
      const resouList = res.data.list
      this.resouList = resouList
      console.log(resouList)
    })
  }

}
</script>

<style scoped>

</style>
