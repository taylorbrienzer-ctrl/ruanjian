<script>
export default {
  onLaunch() {
    console.log('Ling Shan AI guide launched')
  }
}
</script>

<style>
page {
  min-height: 100%;
  color: #17251f;
  background: #f4efe3;
  font-family: "PingFang SC", "Microsoft YaHei", sans-serif;
}

.page {
  min-height: 100vh;
  padding: 28rpx 28rpx 44rpx;
  box-sizing: border-box;
  background: linear-gradient(180deg, #f4efe3 0%, #e7eadc 100%);
}

.topbar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 20rpx;
  margin-bottom: 24rpx;
}

.title {
  font-size: 44rpx;
  line-height: 56rpx;
  font-weight: 800;
  color: #17251f;
}

.subtitle {
  margin-top: 6rpx;
  color: rgba(23, 37, 31, .62);
  font-size: 24rpx;
}

.pill {
  display: inline-flex;
  align-items: center;
  padding: 10rpx 16rpx;
  border-radius: 14rpx;
  color: #2f5f4e;
  background: rgba(255, 250, 240, .82);
  border: 1rpx solid rgba(47, 95, 78, .14);
  font-size: 22rpx;
  font-weight: 700;
}

.card {
  padding: 24rpx;
  border-radius: 16rpx;
  background: rgba(255, 250, 240, .86);
  border: 1rpx solid rgba(47, 95, 78, .12);
  box-shadow: 0 18rpx 44rpx rgba(23, 37, 31, .08);
}

.card-title {
  font-size: 32rpx;
  line-height: 42rpx;
  font-weight: 800;
  color: #213d34;
}

.body {
  margin-top: 12rpx;
  color: rgba(23, 37, 31, .68);
  font-size: 26rpx;
  line-height: 40rpx;
}

.tag-row {
  display: flex;
  flex-wrap: wrap;
  gap: 12rpx;
  margin-top: 18rpx;
}

.tag {
  padding: 8rpx 14rpx;
  border-radius: 12rpx;
  color: #2f5f4e;
  background: rgba(111, 158, 138, .14);
  font-size: 22rpx;
  font-weight: 700;
}

.primary-btn {
  height: 84rpx;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 16rpx;
  color: #fffaf0;
  background: #2f5f4e;
  font-size: 28rpx;
  font-weight: 800;
}

.section {
  margin-top: 22rpx;
}
</style>
