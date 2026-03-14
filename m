Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46D2311C1D
	for <linux-m68k@lists.linux-m68k.org>; Sat, 14 Mar 2026 03:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773457595; cv=none; b=MPAOqEeb7m+xSOgGtsRC1m3lr5r8uou/wewEPtlDX83nMshz5er5l1sJ9s/2wogEZgrXQ22T1kdJFVKK7WGmT/lYVWa2nVxsHA5b/LrccQ0unpg8ShVPSqia9JLQkK9NkWIdz+JGkt4PB51ym4sinNxGNVHhrfH/8GZP7TbMFLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773457595; c=relaxed/simple;
	bh=AR35kwCEfJo7sEZa1YVF3bya3llxgaU0XwOpvFCQj3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b302wsbVHSOtZwsFLN9IG3vmB9Rn0vFq+5yVK452lFcg2kdBBW0GuRodgMTmqGAPKArDFRfDREcobdutXWWY3HvRguV3Lg4TMAiFQqKSRudDdy20n9DxSajFQmIA32Ffkzk52YGFfb5+R4gih4ixc+ys2S2BmGuQg6rkWT6UeNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=NDN7TRfF; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="NDN7TRfF"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-829a27414a3so1685038b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 13 Mar 2026 20:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1773457593; x=1774062393; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKbNTW+AGr0VJ4W7ZqAbg3vbau3fq7bpOdvTyaTfwlU=;
        b=NDN7TRfFBFOFkLR8UkJqR0Ky3mTRAkiEEqvsoCgUk6+vhpoqd8fNZ4CFuL1qusAC7P
         2FVPaqRY12zvuEBQupzpbI6Mzx1oM9aEEQl/0szYt4FcvCGus5KmHjLSsSz4RV0TYXvZ
         h49KzK98/YPXbqYpY1cueR8nOax3KDWJf2isk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773457593; x=1774062393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pKbNTW+AGr0VJ4W7ZqAbg3vbau3fq7bpOdvTyaTfwlU=;
        b=UoVX0EmW7PJrkjkbw78cRj/xj18mCoodOS/2EARxXFQDosVdUDoRuQ5YYFvJSpfIg/
         91opeM8CwMlOAD5z3Kt3djMsjAz9qQC0EYdNToTZrL1G6Iqnp8i4lNKYyfzyqJEb8A6V
         RQPNEHqsUr0DZ9qKkkYiykMFJc9vmFG8peCKqbmC6RQhQ+VsxiLbO9holfw/OmYSQRe1
         abAk79+2B3Mhjjg/6l7nn0Pn047Nx0VRbjg5yJ84PAIjB6s6/1eIgc43duaezk7IQPx+
         Oor2C5hAYJK8kcN1i/zgrSwqhDQhcQdqmZ1EcWOS5IOenKvyqlkK8aYtevYQ5eVKTZgq
         xjTg==
X-Forwarded-Encrypted: i=1; AJvYcCWZHH7ogfZ2KggrYtS14RXd0j9t/G4nKHi83KycuzBh08ceJ3mOetlww0qbP3u+ebztPSAnRWEw9ygT@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzBkCIjK9g9AkdorC8C/sQjHJ9Uv2Dvd9PuZKL0lq9dmEAFE71v
	wjLxaKL7B1HjepCRLMm5QsoWeaGIrXa9UVL7ZZtaNcjEra6BhEMlIKj4iQHwrIzQIeM=
X-Gm-Gg: ATEYQzwerPsETVgmGZzDjS+fLw0oS9NYBDsVTOo+dZ1GHUBjaSpAMNd7nDZ4OXJyCbN
	FAMOfr6Hs41yD2T6Q+gnArjhTKiBhci7CLm4HoXCxM6Q6lVLNdqhONaCxeDWvyjX8EvgN9aBcTr
	jqQxoIfyfYnSDbreBzsA2rV3/rThOeUqKTWCzwVYk6l2dm6UWFeZxgnTN74pzJg4Z651nsO09mN
	fhp7UY34LkY3Y87gfrcK0PhS8+eT96hcROWZIAFqNWEGPKSeKOQ33YC6xgAXBYbI6VX0kaTa4oR
	5Sx6AHEtjVnDUU6sWgRJJAJJzymLjg+R+ZznUgUadalbZ19RBaxEPKUk3kYiF4GV6cSodYtDb/D
	lCBPZHfSixF94u1ndisHH8mrmhPrUCH0Bh9LZ9nPC+sVGEfWKXCAVAoOyWFZH1M+JeyanybMx97
	KYMA2heVg+TDWNwWGAxk0DK4NoNLnh9DizyqMQsCiLuBWZiFqatQfYSxt6GzKfzRDzUz61mItwX
	4gC+yTKforLHNv9
X-Received: by 2002:a05:6a00:2e99:b0:829:88e7:c88b with SMTP id d2e1a72fcca58-82a196db76dmr5417644b3a.19.1773457593159;
        Fri, 13 Mar 2026 20:06:33 -0700 (PDT)
Received: from kinako.work.home.arpa (p1766150-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.167.218.150])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82a13a2f2d6sm8630734b3a.9.2026.03.13.20.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 20:06:30 -0700 (PDT)
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
Subject: [PATCH 1/2] virtio-mmio: Replace sizeof x with sizeof(x)
Date: Sat, 14 Mar 2026 12:06:10 +0900
Message-ID: <20260314030612.1949420-2-daniel@thingy.jp>
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

checkpatch wants the braces.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 drivers/virtio/virtio_mmio.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index 595c2274fbb5..dda915b2ac9f 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -152,21 +152,21 @@ static void vm_get(struct virtio_device *vdev, unsigned int offset,
 	switch (len) {
 	case 1:
 		b = readb(base + offset);
-		memcpy(buf, &b, sizeof b);
+		memcpy(buf, &b, sizeof(b));
 		break;
 	case 2:
 		w = cpu_to_le16(readw(base + offset));
-		memcpy(buf, &w, sizeof w);
+		memcpy(buf, &w, sizeof(w));
 		break;
 	case 4:
 		l = cpu_to_le32(readl(base + offset));
-		memcpy(buf, &l, sizeof l);
+		memcpy(buf, &l, sizeof(l));
 		break;
 	case 8:
 		l = cpu_to_le32(readl(base + offset));
-		memcpy(buf, &l, sizeof l);
-		l = cpu_to_le32(ioread32(base + offset + sizeof l));
-		memcpy(buf + sizeof l, &l, sizeof l);
+		memcpy(buf, &l, sizeof(l));
+		l = cpu_to_le32(ioread32(base + offset + sizeof(l)));
+		memcpy(buf + sizeof(l), &l, sizeof(l));
 		break;
 	default:
 		BUG();
@@ -194,22 +194,22 @@ static void vm_set(struct virtio_device *vdev, unsigned int offset,
 
 	switch (len) {
 	case 1:
-		memcpy(&b, buf, sizeof b);
+		memcpy(&b, buf, sizeof(b));
 		writeb(b, base + offset);
 		break;
 	case 2:
-		memcpy(&w, buf, sizeof w);
+		memcpy(&w, buf, sizeof(w));
 		writew(le16_to_cpu(w), base + offset);
 		break;
 	case 4:
-		memcpy(&l, buf, sizeof l);
+		memcpy(&l, buf, sizeof(l));
 		writel(le32_to_cpu(l), base + offset);
 		break;
 	case 8:
-		memcpy(&l, buf, sizeof l);
+		memcpy(&l, buf, sizeof(l));
 		writel(le32_to_cpu(l), base + offset);
-		memcpy(&l, buf + sizeof l, sizeof l);
-		writel(le32_to_cpu(l), base + offset + sizeof l);
+		memcpy(&l, buf + sizeof(l), sizeof(l));
+		writel(le32_to_cpu(l), base + offset + sizeof(l));
 		break;
 	default:
 		BUG();
-- 
2.51.0

