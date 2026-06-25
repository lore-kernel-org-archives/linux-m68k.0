Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF2122425B
	for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Jun 2026 06:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782367668; cv=none; b=pk2r1uelDyyVAgn2ju3NwPfcydCs+Na9xVb+5evZzfNzDpZ6rZ048o1Orru/dRBn9tFe6sRHJcg0ha5ygxzsCaPTxkzkgUyQF2n1xf9FVe0cg2isYUdDpphJwdaPCLB+ykiA0OEiTNLIG/Rn5DAL71pZbZzhYa/1BYhxFlHxrNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782367668; c=relaxed/simple;
	bh=ikVCa1w8PxhUgzUyjqsCBI4G4PJpX9aKSF9nwn86tg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HcZFU2EAk9/elhWs1cybPECv/f6JROC4aArfVPRFD2IT01WBoWImQwf6idgiGa6FOdYuA3CH9kDKUhPOQlq1iS4eTV4NHHDsRuX6wNtIxWyuchfMRXm+BDbydI3mRTpqn56XngJlYsHCPerZwCsplcYF0PwPz64oQXMTs/MLVxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABXo8avxTxqYYEoFQ--.18513S2;
	Thu, 25 Jun 2026 14:07:43 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [RFC] m68k: stale CONFIG_MTD_UCLINUX still guards ROMFS relocation paths
Date: Thu, 25 Jun 2026 14:07:42 +0800
Message-ID: <20260625060742.7769-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABXo8avxTxqYYEoFQ--.18513S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trW5tFyxXF4Dtw17uFWkCrg_yoW8Gr1fpa
	ykGw45tw1kG3y3G39rZrykWr4FyrZ7tFy5Gr15Gr1UAayfAryjvrs0gFW7ua43Zr9YqF17
	KF93KF9xAws0yrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUe0PSUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Hi,

while auditing conditional source paths, I noticed that current m68k source
still has an early boot/data path guarded by CONFIG_MTD_UCLINUX, but that
symbol no longer appears to have a Kconfig provider in current mainline.

The relevant guard is in arch/m68k/68000/head.S:

#if defined(CONFIG_ROMFS_FS) && defined(CONFIG_RAMKERNEL) && \
    defined(CONFIG_MTD_UCLINUX)

That guarded block moves ROMFS data and adjusts _ramstart / __bss_stop
related state.  At the same time, several m68k defconfigs still request
CONFIG_MTD_UCLINUX together with ROMFS support.

A bounded config oracle over representative m68k defconfigs shows that the
final .config drops CONFIG_MTD_UCLINUX because the symbol has no current
provider.  In other words, the source still describes a boot/data world that
the current Kconfig universe cannot realize.

I am not sending a patch yet because the intended repair is a policy question:

1. remove the stale defconfig requests and guarded source path;
2. retarget the guard to a current condition; or
3. restore an arch-local option if this boot path is still intended.

Could you advise which direction is expected for the remaining
CONFIG_MTD_UCLINUX guarded m68k path?

This is static source/config analysis only.  I have not runtime-tested the
affected boards.

Thanks,
Pengpeng

