Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC75A30F52B
	for <linux-m68k@lists.linux-m68k.org>; Sat, 14 Mar 2026 03:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773457599; cv=none; b=Or/pqVOiZdkGeo5wHx5ayVUG5sEv7JoWK3+IRYHuGk00W2tbbYi8fAYa1X9PUdW235zGh7UKaYUvrYWYVSwYW+h5f2GcKPuzxd+dhVi929J6ciYwuSUZl1VKexIzg+Jh0ewLbmUOjqlRrL13Qh1K5JwjuSfY/bktRK/t8FlCaLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773457599; c=relaxed/simple;
	bh=ZCWJCyW6WD5vSFHgmTB0ZOIU1gR4DOLFSnoLv4aien0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqyRDeCrhm+0N/sJM0XH6MYXsz2WBAetyyclsTh19bV9qBRfiurZgQFZB2H6UM9KrYFgLQyzds6mSuqBQAnzDFhFyxgFM/kIPQu5cokNKaX1tudKIaJwDhYZMpoCwEiwDAcvloskT86w1zzTA9TWzllskR8jQLLJhCndHf4Ht2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=nrkNepOr; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="nrkNepOr"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82987437624so1572793b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 13 Mar 2026 20:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1773457596; x=1774062396; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUxqj+VyJFyV6/4cZL41qfYeQvqWY65y8qLHAn3DJeo=;
        b=nrkNepOrzcVLZufN5uxFDC7I12AS+QxyTX6+LxpIhFoRYwDLmh8SngVu/lIMOR/Dbm
         AEylKg7Cs6DuZ3Sx+73GQhSrKsh77g5UD2UWFaT0nMHgoklRRSXp42xS5fiQFo3BWIC9
         +QfDDrDv0qb986KpED7FmLM+pCQGGSkwnZD/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773457596; x=1774062396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EUxqj+VyJFyV6/4cZL41qfYeQvqWY65y8qLHAn3DJeo=;
        b=osh2dwg57mm9DBUwwsRx/s5JBvqBE7R9cy9d2HzIAeN9Ais2o59klr/ghySdmdlSom
         pEgQ3Wtvv4yjVWjsHsMfEXIfHqrTsdPOV2NcsIbTAsbV0RJSCY/ihyOGD+cqVwesbDGV
         +tdn01hxLmcYrz5wnaQVQnEdsiVEyl4vy3nIF5TcMdFiDvtqfLWz1MDw0/KXtSKQEjeM
         CnU7xNx1N9ijNLXJSa3z7msfmX5vEf0CDJH3vIkE9uVPhO24A4mYv/O0liflM6qPtKC8
         M6ptW1/5vKuWbLxUfRkR7gRtcSRWTkZ3VvJxroGKpwRextDkcQwwPgK9pyj6MCfKlCIR
         8Qkw==
X-Forwarded-Encrypted: i=1; AJvYcCXnHpsC4q4t/37XtSON1+I2l7jVt6i0XQGDcyLKGvBImSsmRTENJl+qEaT5TzKZxPi8xgRSxBt/8TIW@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyweuOodF9OmhBR14NlLb86TDrvMvQ3fTG38cYHDgDhztrOQ1sI
	t7dOm0bxveIqxF1YGH5RpDNB7L+TpTODLqDA3yn+8QdM4tBmQN6KcJ59gbDMTvCaZyk=
X-Gm-Gg: ATEYQzylkjHlV93yX6OoeYE5KqPnPhZp098PfipvGPOpGt8VDDU4k55ZyRHxxE037Ln
	23DyXDiYN2pI1S0DB+OgJBngvli4uqArpOX1yHwpK4xDnlHVZrRRhdN00hy+BBIlRgfLqnY+u1v
	f6xeTGb5xQSuHEwaW8EsfyyIHHDLWB1ZAmMFvhD8BEmIMLKKBZeDg+9Y8gqdasRx37FOAAtfcA5
	5Py/OVEaSN+MgYVCbfgzPo9sixpOvHdEQjEZIZApKo1KplsA1cMmmziH51WuOxGYP4RIxJGZdo9
	v8LPrN8mSp0S8pZZgP/eXtQUjdtHe+gpgXFeU/4qbiR5CvKQdYHKT3TSlUeOFaZfmgQgS0XIiIq
	84dEXHnjHmQS4NFhDgYc6GRPtQ5ulxPyLPgbK//GXEayLTlR9wnDbU4+AIz9Jr1zrRMBy0aZ52G
	3QQB2eH1qBosNy6L/EwMqut71yzdQXGPqK4PixFOifH8DBMfiQKrWZIU6o8LJQewBkKlFQrC1UL
	z6hPV8Dg4duQjjB
X-Received: by 2002:a05:6a00:99b:b0:81f:804f:af26 with SMTP id d2e1a72fcca58-82a07285f11mr7610311b3a.19.1773457596235;
        Fri, 13 Mar 2026 20:06:36 -0700 (PDT)
Received: from kinako.work.home.arpa (p1766150-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.167.218.150])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82a13a2f2d6sm8630734b3a.9.2026.03.13.20.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 20:06:35 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: mst@redhat.com,
	jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com
Cc: virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	arnd@kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH 2/2] virtio-mmio: Use raw io accessors to avoid arch issues
Date: Sat, 14 Mar 2026 12:06:11 +0900
Message-ID: <20260314030612.1949420-3-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260314030612.1949420-1-daniel@thingy.jp>
References: <20260314030612.1949420-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtio-mmio registers are always little endian even on machines
where peripheral registers are normally big endian.

At least on nommu, non-coldfire, m68k (see: arch/m68k/include/asm/io_no.h)
readl() and friends are defined to the raw versions. So the value from
the bus is returned as is.

Since virtio-mmio is a bit special and will always be little endian
even if that is different to the machine's convention use the raw
accessors and do the endian swap, where needed, in house.

There are some places in the code where the little endian values are
actually wanted and we currently swap those back again. If we don't
swap them in the first place maybe that saves some unneeded swapping?

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 drivers/virtio/virtio_mmio.c | 120 +++++++++++++++++++----------------
 1 file changed, 64 insertions(+), 56 deletions(-)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index dda915b2ac9f..4050533cc976 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -70,7 +70,14 @@
 #include <uapi/linux/virtio_mmio.h>
 #include <linux/virtio_ring.h>
 
-
+/*
+ * The virtio registers are always little endian, even on machines
+ * where everything else is big endian. readl()/write() could use the
+ * value from the bus as-is or endian swap it from little endian.
+ * To avoid confusion use the raw accessors and do the swap here.
+ */
+#define virtio_mmio_readl(addr)		le32_to_cpu(__raw_readl(addr))
+#define virtio_mmio_writel(value, addr)	__raw_writel(cpu_to_le32(value), addr)
 
 /* The alignment to use between consumer and producer parts of vring.
  * Currently hardcoded to the page size. */
@@ -96,12 +103,12 @@ static u64 vm_get_features(struct virtio_device *vdev)
 	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
 	u64 features;
 
-	writel(1, vm_dev->base + VIRTIO_MMIO_DEVICE_FEATURES_SEL);
-	features = readl(vm_dev->base + VIRTIO_MMIO_DEVICE_FEATURES);
+	virtio_mmio_writel(1, vm_dev->base + VIRTIO_MMIO_DEVICE_FEATURES_SEL);
+	features = virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_DEVICE_FEATURES);
 	features <<= 32;
 
-	writel(0, vm_dev->base + VIRTIO_MMIO_DEVICE_FEATURES_SEL);
-	features |= readl(vm_dev->base + VIRTIO_MMIO_DEVICE_FEATURES);
+	virtio_mmio_writel(0, vm_dev->base + VIRTIO_MMIO_DEVICE_FEATURES_SEL);
+	features |= virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_DEVICE_FEATURES);
 
 	return features;
 }
@@ -120,12 +127,12 @@ static int vm_finalize_features(struct virtio_device *vdev)
 		return -EINVAL;
 	}
 
-	writel(1, vm_dev->base + VIRTIO_MMIO_DRIVER_FEATURES_SEL);
-	writel((u32)(vdev->features >> 32),
+	virtio_mmio_writel(1, vm_dev->base + VIRTIO_MMIO_DRIVER_FEATURES_SEL);
+	virtio_mmio_writel((u32)(vdev->features >> 32),
 			vm_dev->base + VIRTIO_MMIO_DRIVER_FEATURES);
 
-	writel(0, vm_dev->base + VIRTIO_MMIO_DRIVER_FEATURES_SEL);
-	writel((u32)vdev->features,
+	virtio_mmio_writel(0, vm_dev->base + VIRTIO_MMIO_DRIVER_FEATURES_SEL);
+	virtio_mmio_writel((u32)vdev->features,
 			vm_dev->base + VIRTIO_MMIO_DRIVER_FEATURES);
 
 	return 0;
@@ -155,17 +162,17 @@ static void vm_get(struct virtio_device *vdev, unsigned int offset,
 		memcpy(buf, &b, sizeof(b));
 		break;
 	case 2:
-		w = cpu_to_le16(readw(base + offset));
+		w = __raw_readw(base + offset);
 		memcpy(buf, &w, sizeof(w));
 		break;
 	case 4:
-		l = cpu_to_le32(readl(base + offset));
+		l = __raw_readl(base + offset);
 		memcpy(buf, &l, sizeof(l));
 		break;
 	case 8:
-		l = cpu_to_le32(readl(base + offset));
+		l = __raw_readl(base + offset);
 		memcpy(buf, &l, sizeof(l));
-		l = cpu_to_le32(ioread32(base + offset + sizeof(l)));
+		l = __raw_readl(base + offset + sizeof(l));
 		memcpy(buf + sizeof(l), &l, sizeof(l));
 		break;
 	default:
@@ -199,17 +206,17 @@ static void vm_set(struct virtio_device *vdev, unsigned int offset,
 		break;
 	case 2:
 		memcpy(&w, buf, sizeof(w));
-		writew(le16_to_cpu(w), base + offset);
+		__raw_writew(w, base + offset);
 		break;
 	case 4:
 		memcpy(&l, buf, sizeof(l));
-		writel(le32_to_cpu(l), base + offset);
+		__raw_writel(l, base + offset);
 		break;
 	case 8:
 		memcpy(&l, buf, sizeof(l));
-		writel(le32_to_cpu(l), base + offset);
+		__raw_writel(l, base + offset);
 		memcpy(&l, buf + sizeof(l), sizeof(l));
-		writel(le32_to_cpu(l), base + offset + sizeof(l));
+		__raw_writel(l, base + offset + sizeof(l));
 		break;
 	default:
 		BUG();
@@ -223,14 +230,14 @@ static u32 vm_generation(struct virtio_device *vdev)
 	if (vm_dev->version == 1)
 		return 0;
 	else
-		return readl(vm_dev->base + VIRTIO_MMIO_CONFIG_GENERATION);
+		return virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_CONFIG_GENERATION);
 }
 
 static u8 vm_get_status(struct virtio_device *vdev)
 {
 	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
 
-	return readl(vm_dev->base + VIRTIO_MMIO_STATUS) & 0xff;
+	return virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_STATUS) & 0xff;
 }
 
 static void vm_set_status(struct virtio_device *vdev, u8 status)
@@ -245,7 +252,7 @@ static void vm_set_status(struct virtio_device *vdev, u8 status)
 	 * that the cache coherent memory writes have completed
 	 * before writing to the MMIO region.
 	 */
-	writel(status, vm_dev->base + VIRTIO_MMIO_STATUS);
+	virtio_mmio_writel(status, vm_dev->base + VIRTIO_MMIO_STATUS);
 }
 
 static void vm_reset(struct virtio_device *vdev)
@@ -253,7 +260,7 @@ static void vm_reset(struct virtio_device *vdev)
 	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
 
 	/* 0 status means a reset. */
-	writel(0, vm_dev->base + VIRTIO_MMIO_STATUS);
+	virtio_mmio_writel(0, vm_dev->base + VIRTIO_MMIO_STATUS);
 }
 
 
@@ -267,7 +274,7 @@ static bool vm_notify(struct virtqueue *vq)
 
 	/* We write the queue's selector into the notification register to
 	 * signal the other end */
-	writel(vq->index, vm_dev->base + VIRTIO_MMIO_QUEUE_NOTIFY);
+	virtio_mmio_writel(vq->index, vm_dev->base + VIRTIO_MMIO_QUEUE_NOTIFY);
 	return true;
 }
 
@@ -276,7 +283,7 @@ static bool vm_notify_with_data(struct virtqueue *vq)
 	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vq->vdev);
 	u32 data = vring_notification_data(vq);
 
-	writel(data, vm_dev->base + VIRTIO_MMIO_QUEUE_NOTIFY);
+	virtio_mmio_writel(data, vm_dev->base + VIRTIO_MMIO_QUEUE_NOTIFY);
 
 	return true;
 }
@@ -290,8 +297,8 @@ static irqreturn_t vm_interrupt(int irq, void *opaque)
 	irqreturn_t ret = IRQ_NONE;
 
 	/* Read and acknowledge interrupts */
-	status = readl(vm_dev->base + VIRTIO_MMIO_INTERRUPT_STATUS);
-	writel(status, vm_dev->base + VIRTIO_MMIO_INTERRUPT_ACK);
+	status = virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_INTERRUPT_STATUS);
+	virtio_mmio_writel(status, vm_dev->base + VIRTIO_MMIO_INTERRUPT_ACK);
 
 	if (unlikely(status & VIRTIO_MMIO_INT_CONFIG)) {
 		virtio_config_changed(&vm_dev->vdev);
@@ -314,12 +321,12 @@ static void vm_del_vq(struct virtqueue *vq)
 	unsigned int index = vq->index;
 
 	/* Select and deactivate the queue */
-	writel(index, vm_dev->base + VIRTIO_MMIO_QUEUE_SEL);
+	virtio_mmio_writel(index, vm_dev->base + VIRTIO_MMIO_QUEUE_SEL);
 	if (vm_dev->version == 1) {
-		writel(0, vm_dev->base + VIRTIO_MMIO_QUEUE_PFN);
+		virtio_mmio_writel(0, vm_dev->base + VIRTIO_MMIO_QUEUE_PFN);
 	} else {
-		writel(0, vm_dev->base + VIRTIO_MMIO_QUEUE_READY);
-		WARN_ON(readl(vm_dev->base + VIRTIO_MMIO_QUEUE_READY));
+		virtio_mmio_writel(0, vm_dev->base + VIRTIO_MMIO_QUEUE_READY);
+		WARN_ON(virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_QUEUE_READY));
 	}
 
 	vring_del_virtqueue(vq);
@@ -362,16 +369,17 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
 		return NULL;
 
 	/* Select the queue we're interested in */
-	writel(index, vm_dev->base + VIRTIO_MMIO_QUEUE_SEL);
+	virtio_mmio_writel(index, vm_dev->base + VIRTIO_MMIO_QUEUE_SEL);
 
 	/* Queue shouldn't already be set up. */
-	if (readl(vm_dev->base + (vm_dev->version == 1 ?
+	if (virtio_mmio_readl(vm_dev->base + (vm_dev->version == 1 ?
 			VIRTIO_MMIO_QUEUE_PFN : VIRTIO_MMIO_QUEUE_READY))) {
 		err = -ENOENT;
 		goto error_available;
 	}
 
-	num = readl(vm_dev->base + VIRTIO_MMIO_QUEUE_NUM_MAX);
+	num = virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_QUEUE_NUM_MAX);
+
 	if (num == 0) {
 		err = -ENOENT;
 		goto error_new_virtqueue;
@@ -388,7 +396,7 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
 	vq->num_max = num;
 
 	/* Activate the queue */
-	writel(virtqueue_get_vring_size(vq), vm_dev->base + VIRTIO_MMIO_QUEUE_NUM);
+	virtio_mmio_writel(virtqueue_get_vring_size(vq), vm_dev->base + VIRTIO_MMIO_QUEUE_NUM);
 	if (vm_dev->version == 1) {
 		u64 q_pfn = virtqueue_get_desc_addr(vq) >> PAGE_SHIFT;
 
@@ -405,27 +413,27 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
 			goto error_bad_pfn;
 		}
 
-		writel(PAGE_SIZE, vm_dev->base + VIRTIO_MMIO_QUEUE_ALIGN);
-		writel(q_pfn, vm_dev->base + VIRTIO_MMIO_QUEUE_PFN);
+		virtio_mmio_writel(PAGE_SIZE, vm_dev->base + VIRTIO_MMIO_QUEUE_ALIGN);
+		virtio_mmio_writel(q_pfn, vm_dev->base + VIRTIO_MMIO_QUEUE_PFN);
 	} else {
 		u64 addr;
 
 		addr = virtqueue_get_desc_addr(vq);
-		writel((u32)addr, vm_dev->base + VIRTIO_MMIO_QUEUE_DESC_LOW);
-		writel((u32)(addr >> 32),
+		virtio_mmio_writel((u32)addr, vm_dev->base + VIRTIO_MMIO_QUEUE_DESC_LOW);
+		virtio_mmio_writel((u32)(addr >> 32),
 				vm_dev->base + VIRTIO_MMIO_QUEUE_DESC_HIGH);
 
 		addr = virtqueue_get_avail_addr(vq);
-		writel((u32)addr, vm_dev->base + VIRTIO_MMIO_QUEUE_AVAIL_LOW);
-		writel((u32)(addr >> 32),
+		virtio_mmio_writel((u32)addr, vm_dev->base + VIRTIO_MMIO_QUEUE_AVAIL_LOW);
+		virtio_mmio_writel((u32)(addr >> 32),
 				vm_dev->base + VIRTIO_MMIO_QUEUE_AVAIL_HIGH);
 
 		addr = virtqueue_get_used_addr(vq);
-		writel((u32)addr, vm_dev->base + VIRTIO_MMIO_QUEUE_USED_LOW);
-		writel((u32)(addr >> 32),
+		virtio_mmio_writel((u32)addr, vm_dev->base + VIRTIO_MMIO_QUEUE_USED_LOW);
+		virtio_mmio_writel((u32)(addr >> 32),
 				vm_dev->base + VIRTIO_MMIO_QUEUE_USED_HIGH);
 
-		writel(1, vm_dev->base + VIRTIO_MMIO_QUEUE_READY);
+		virtio_mmio_writel(1, vm_dev->base + VIRTIO_MMIO_QUEUE_READY);
 	}
 
 	return vq;
@@ -434,10 +442,10 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
 	vring_del_virtqueue(vq);
 error_new_virtqueue:
 	if (vm_dev->version == 1) {
-		writel(0, vm_dev->base + VIRTIO_MMIO_QUEUE_PFN);
+		virtio_mmio_writel(0, vm_dev->base + VIRTIO_MMIO_QUEUE_PFN);
 	} else {
-		writel(0, vm_dev->base + VIRTIO_MMIO_QUEUE_READY);
-		WARN_ON(readl(vm_dev->base + VIRTIO_MMIO_QUEUE_READY));
+		virtio_mmio_writel(0, vm_dev->base + VIRTIO_MMIO_QUEUE_READY);
+		WARN_ON(virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_QUEUE_READY));
 	}
 error_available:
 	return ERR_PTR(err);
@@ -496,11 +504,11 @@ static bool vm_get_shm_region(struct virtio_device *vdev,
 	u64 len, addr;
 
 	/* Select the region we're interested in */
-	writel(id, vm_dev->base + VIRTIO_MMIO_SHM_SEL);
+	virtio_mmio_writel(id, vm_dev->base + VIRTIO_MMIO_SHM_SEL);
 
 	/* Read the region size */
-	len = (u64) readl(vm_dev->base + VIRTIO_MMIO_SHM_LEN_LOW);
-	len |= (u64) readl(vm_dev->base + VIRTIO_MMIO_SHM_LEN_HIGH) << 32;
+	len = (u64) virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_SHM_LEN_LOW);
+	len |= (u64) virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_SHM_LEN_HIGH) << 32;
 
 	region->len = len;
 
@@ -511,8 +519,8 @@ static bool vm_get_shm_region(struct virtio_device *vdev,
 		return false;
 
 	/* Read the region base address */
-	addr = (u64) readl(vm_dev->base + VIRTIO_MMIO_SHM_BASE_LOW);
-	addr |= (u64) readl(vm_dev->base + VIRTIO_MMIO_SHM_BASE_HIGH) << 32;
+	addr = (u64) virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_SHM_BASE_LOW);
+	addr |= (u64) virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_SHM_BASE_HIGH) << 32;
 
 	region->addr = addr;
 
@@ -548,7 +556,7 @@ static int virtio_mmio_restore(struct device *dev)
 	struct virtio_mmio_device *vm_dev = dev_get_drvdata(dev);
 
 	if (vm_dev->version == 1)
-		writel(PAGE_SIZE, vm_dev->base + VIRTIO_MMIO_GUEST_PAGE_SIZE);
+		virtio_mmio_writel(PAGE_SIZE, vm_dev->base + VIRTIO_MMIO_GUEST_PAGE_SIZE);
 
 	return virtio_device_restore(&vm_dev->vdev);
 }
@@ -591,7 +599,7 @@ static int virtio_mmio_probe(struct platform_device *pdev)
 	}
 
 	/* Check magic value */
-	magic = readl(vm_dev->base + VIRTIO_MMIO_MAGIC_VALUE);
+	magic = virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_MAGIC_VALUE);
 	if (magic != ('v' | 'i' << 8 | 'r' << 16 | 't' << 24)) {
 		dev_warn(&pdev->dev, "Wrong magic value 0x%08lx!\n", magic);
 		rc = -ENODEV;
@@ -599,7 +607,7 @@ static int virtio_mmio_probe(struct platform_device *pdev)
 	}
 
 	/* Check device version */
-	vm_dev->version = readl(vm_dev->base + VIRTIO_MMIO_VERSION);
+	vm_dev->version = virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_VERSION);
 	if (vm_dev->version < 1 || vm_dev->version > 2) {
 		dev_err(&pdev->dev, "Version %ld not supported!\n",
 				vm_dev->version);
@@ -607,7 +615,7 @@ static int virtio_mmio_probe(struct platform_device *pdev)
 		goto free_vm_dev;
 	}
 
-	vm_dev->vdev.id.device = readl(vm_dev->base + VIRTIO_MMIO_DEVICE_ID);
+	vm_dev->vdev.id.device = virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_DEVICE_ID);
 	if (vm_dev->vdev.id.device == 0) {
 		/*
 		 * virtio-mmio device with an ID 0 is a (dummy) placeholder
@@ -616,10 +624,10 @@ static int virtio_mmio_probe(struct platform_device *pdev)
 		rc = -ENODEV;
 		goto free_vm_dev;
 	}
-	vm_dev->vdev.id.vendor = readl(vm_dev->base + VIRTIO_MMIO_VENDOR_ID);
+	vm_dev->vdev.id.vendor = virtio_mmio_readl(vm_dev->base + VIRTIO_MMIO_VENDOR_ID);
 
 	if (vm_dev->version == 1) {
-		writel(PAGE_SIZE, vm_dev->base + VIRTIO_MMIO_GUEST_PAGE_SIZE);
+		virtio_mmio_writel(PAGE_SIZE, vm_dev->base + VIRTIO_MMIO_GUEST_PAGE_SIZE);
 
 		rc = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
 		/*
-- 
2.51.0

