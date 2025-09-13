Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5511339A4
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 01:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757725447; cv=none; b=KDwxiwqzWdtOmb5GzhRSUYFO0rWgAHwzmzHwrnGwQ8uGrRivUnyaAioMmAWpt2OtNu19TqK8W5Uh/6bdB2VjZcDRcJHaDyZkNRnV9K4zBqUlzcbG5+bQwVvrjjb3Oi99tZ8uNoIqZnlFfK3q3ilGF5eRDSrbIAaNl8ezZMtNzZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757725447; c=relaxed/simple;
	bh=XdKFLt7HKTWqlTaryS+0sdRR6IIe2s8E5XqHxfJZ80U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOIypktUk5VUsGv2mIBWmtjLOtSfhyaAb4xgdwIhr/1dBLebF9w3eYa7Ig5l8rbwtDB3qnYRRpGCblz2v22GkcvUcugMVTb8mDfrumLuHmOcXI+xBW5EhRTsG/PuOeuPb/BqlyZeKxDfT6m1MWiwQHeZo8fv0L/dUfUBoEZQeGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K35n97xu; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K35n97xu"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62f0411577aso377928a12.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Sep 2025 18:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725444; x=1758330244; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QP3KPO8+P4bejD4XvvOjfSlYK9K4kJKcAHCDef6XF+Q=;
        b=K35n97xuqqsvxgeJ2mKNIYYmV7c2/isdUbm/wt/j7boU/4O2l7KdGqeZbCa+yk9u/J
         4+a5c1MNfDqerXKA4luO6gg2n1k5bx+4eSh2B0wtuEUdgySi8XLnTEfwpIapw0pv1/as
         Kp6OoCL7MQ2Hv8B0mZq8kxYJJ8oxe89yOfbPBDHFVRphwGd2Ut8iTpAUCmDlqSHVoqdQ
         ratTZIWs2ZgCI1XijwuLbm9D5L3TQ9uAbeFuha46UARUmvRKrOb/75CFkHc6/LDXdnbE
         E2JTu8XZtiAUg5JncLRg2WLiFS92Mjqhtpgj6OPs9b2sLdbigMszFXtpus+uUdU9r9uu
         Zyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725444; x=1758330244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QP3KPO8+P4bejD4XvvOjfSlYK9K4kJKcAHCDef6XF+Q=;
        b=wwSfMJgp31Nc/UzEyVjX/2JTajc6SqHBIM+XiuifucG2nADEtVSwRh+lXF8p1xx0RN
         /imrxLL3QC7rdYl6/q9QlQ4sLbG0L7f1Rt1QabS+lTARZg4J3MuMsTDKM4ypHek2Aa9n
         /jc1zAJuvVefyG371372zB0+Q8pBBxn2DTjkvWQEPbpjq01pO7G83uTI9U5OvzO49ym6
         3fJPgv+zHSCwtkdq8sl2uf7MV90EcRh62wOmwm0s6W9Y3mMd1yQA+wFhaT941+oETa2I
         Mm9oKyGEFFkkzh2M8AjIz+smI1AJyb5q0Q5M24EmcXZ/aaAQz39xgXBKmw5+oycDvtOB
         2cUg==
X-Forwarded-Encrypted: i=1; AJvYcCV+Vka5dN9l3vFAAazAwQfXazNjRHUXyFnF2jpnYmYEgxZv4jpoqdJF0ExFlOMkuQr+IE59Ypmgs4zi@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzZTnfCpVqvKOaHdVdDDii27Al3ibWtUaEYa4nL8957RQfmEOYJ
	2ihtl6LrbdKhgOuRPqybUplzPhwWGEbW3MqnIu1RR/QgkZunnqL1YMQs
X-Gm-Gg: ASbGncuh23lRiD6MfHL6wcJ45kmgF8pnqLUmYcpoNrRh50T6SvJ4Eu1eShbSmRsPEeY
	TnYUtWjCYeHsxaFbackXsAyAbiD6iMCWTXzaOZubTngf0/snUCOw4SXMiMT4Xps9Ec/SmVdMZ41
	zaTu9lQV12+PFlZJFl9NnhGDNyKhy2qHYnTBTQC1gYCg8sQjt/Qb7rjEtp5KQH5+iZhvvCepSsA
	G8TCsM4wKemhKjcvJzk39SrXcV9j3hhpZVtSkXiTcpYaI0WpVvFsB9dmvZZLPJNkiE9qkqm0wHI
	eraI0q0c338CFDAPFOoL0ldMkW4kYBTkt30kw6O2PIVcfkKHmtDv2UrdrAhDFGSboADcPq/l0rF
	Ei33oq+BqXFUAWBFmoZsH30nlpJ9zDQ==
X-Google-Smtp-Source: AGHT+IF5gJzNBXdtzBXv0OSH4ftjGJnmmybFv16rcAGk5hl57bAzoCs28S7e9w+ysKsSQWZRdIzUSQ==
X-Received: by 2002:a05:6402:3482:b0:61d:249a:43fe with SMTP id 4fb4d7f45d1cf-62ed82c5a43mr4352436a12.24.1757725443498;
        Fri, 12 Sep 2025 18:04:03 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec6b6cec5sm4014207a12.1.2025.09.12.18.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:04:02 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 22/62] doc: remove obsolete mentions of pivot_root
Date: Sat, 13 Sep 2025 00:38:01 +0000
Message-ID: <20250913003842.41944-23-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They refer to initrd, which was removed in previous commits

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/device-mapper/dm-init.rst | 4 ++--
 Documentation/arch/arm/ixp4xx.rst                   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-init.rst b/Documentation/admin-guide/device-mapper/dm-init.rst
index 981d6a907699..586bb38d716b 100644
--- a/Documentation/admin-guide/device-mapper/dm-init.rst
+++ b/Documentation/admin-guide/device-mapper/dm-init.rst
@@ -5,8 +5,8 @@ Early creation of mapped devices
 It is possible to configure a device-mapper device to act as the root device for
 your system in two ways.
 
-The first is to build an initial ramdisk which boots to a minimal userspace
-which configures the device, then pivot_root(8) in to it.
+The first is to build initramfs which boots to a minimal userspace
+which configures the device, then switches to it.
 
 The second is to create one or more device-mappers using the module parameter
 "dm-mod.create=" through the kernel boot command line argument.
diff --git a/Documentation/arch/arm/ixp4xx.rst b/Documentation/arch/arm/ixp4xx.rst
index 17aafc610908..ac9cb28776c7 100644
--- a/Documentation/arch/arm/ixp4xx.rst
+++ b/Documentation/arch/arm/ixp4xx.rst
@@ -137,8 +137,8 @@ Intel IXDPG425 Development Platform
    added. One issue with this board is that the mini-PCI slots only
    have the 3.3v line connected, so you can't use a PCI to mini-PCI
    adapter with an E100 card. So to NFS root you need to use either
-   the CSR or a WiFi card and a ramdisk that BOOTPs and then does
-   a pivot_root to NFS.
+   the CSR or a WiFi card and initramfs that BOOTPs and then switches
+   to NFS.
 
 Motorola PrPMC1100 Processor Mezanine Card
 http://www.fountainsys.com
-- 
2.47.2

