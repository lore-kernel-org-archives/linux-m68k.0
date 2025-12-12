Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBA130DEBB
	for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Dec 2025 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765542587; cv=none; b=YsFOmPYducIW74t2FQeFRbvegNUDy2StTazNoXIvhuC8iEL4/vJcazf1ldYdI4cDNN7QjyY7w4NwnEFYXbl8LlSz5wUdmh/fcb+/nG9MsXYobiREqg8KgGu95UnvuFORgE/+FVcgF7OWTJnLmzYc1Mc3nj08OBSn1kZ4GbSleN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765542587; c=relaxed/simple;
	bh=MvFlc4yA4VYklYrn6VSU7nom+HE54NhdUPg0kJMK9EA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZJgY8aOd5by66hksv5K1uXrjV/oc+hIwz4z//cVM8rrt23IVZJ/vf8VNdaj+GVlfNrp5sy8obkf/F7dqUO2hXXIRKbHto+t390IeGXw6yGKNfgh6b283F9/7+YCQ6QUwNl1EESYhumL280O6/5601pzWCdZUuUmRu8PWG6ebuIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.239])
	by APP-05 (Coremail) with SMTP id zQCowACnOQ2sCjxpNERxAA--.11928S2;
	Fri, 12 Dec 2025 20:29:32 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: fthain@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH] nubus: add a cleanup in nubus_init()
Date: Fri, 12 Dec 2025 20:29:30 +0800
Message-Id: <20251212122930.36115-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACnOQ2sCjxpNERxAA--.11928S2
X-Coremail-Antispam: 1UD129KBjvdXoWrXF13Ww17Kr43ZrW7uw1xXwb_yoWxWFc_Kr
	4jvw13Xr1q9F1xK3yakw45Zryq9rn2vr48XFWftrWftry5WrWYqFWDZrn8Krn8urWYyr12
	kFW7JryDAry7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbwxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1F6r1fM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5WlkUUUUU
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwkOE2k8ADEeEAAAs5

If nubus_parent_device_register fails, call put_device()
to drop the device reference.

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/nubus/nubus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index ab0f32b901c8..21706bdcb509 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -883,8 +883,10 @@ static int __init nubus_init(void)
 
 	nubus_proc_init();
 	err = nubus_parent_device_register();
-	if (err)
+	if (err) {
+		put_device(&nubus_parent);
 		return err;
+	}
 	nubus_scan_bus();
 	return 0;
 }
-- 
2.25.1

