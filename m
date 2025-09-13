Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1922E70810
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 00:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757724072; cv=none; b=b0d7yEOH60BIg4DwAu0VhFksVor7i9xGixnwPAT0Xgn+6kmDp+VqipA2qvJ1PBOO16fXxf7vy1NHf/KCu+w3JMRp/+PK3H7DjU9ixMnnExQ399r435vCFWp3Sz+PsMAl6ERcLM38PDO0CoHRj703uWYqd6QACWOnH5mZaEPpbZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757724072; c=relaxed/simple;
	bh=yhXDovoFaZRmENn1P/7nJEAYKmeDJf//ZQgmQHs9gQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ey8FTpHsquBGWb5tu9mzNTnKDyZNUD4JQ+0NGWUo4hLXXRsTgn2YBSK78TK8JZVpIuX/YskMtO9v/jSHnVBrKOK5J2uxZ8gt8e/QTltbH/lcjOce8WWwX9iziAjEGEsIDSr2GDa6FyL2Oiw7qvOri3ps78D8e8M6gxo3FhfpD9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEhkzUL+; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEhkzUL+"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62ee43b5e96so1599044a12.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Sep 2025 17:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724067; x=1758328867; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XF39SoyvPO4HSizOmVkN9E4c/OCzbmGR6ZiNtCSz3R4=;
        b=fEhkzUL+fLT8UfCDZ73MSof2B3Z7A+cS6uluvXlJvCYB1Iz43gTzDoFsdPpo4hGbfv
         5JFQmE9hEYTInVtkBpr23svnrEMG4EmhP2wMUIsDVs3MJmnY8pQeUy1kbhn/qRiBeH9d
         gczWOIfHPSxn2JJytNCnzVaRedPpNGS72ES3CM3KGqhpp68vGlHUH2XODDznLwS01k8t
         h1actF7zqeV4UEi4e+XeLCF3IyK/gm9DaT/tQ9Y2ZGVxfksM22kMN9KiryBqgexEeeBb
         Gj4IyE4j1RreVapLBDqbLEtUFX+3jtUr1XPta8QQtLPwS9q4dd1jkA+j1Pni7YwaZcoO
         eJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724067; x=1758328867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XF39SoyvPO4HSizOmVkN9E4c/OCzbmGR6ZiNtCSz3R4=;
        b=MTDEpeHkQFLEZnEFWoS0E3kxsLn+cZYm4zsgQG39bhM9aqTFrqzOAKBf5qBv8nHpKo
         KlH/1zZvwgIfTjKUiTOwNzVmkZPcK3yz/uOo81+vVgB5nZbKt/QLoGyYloXxmo5KspA1
         N+eRTFAigYsKwmfGvb9zRvpWKgw/o3A3+/xjb/yqx4qsXWi6pOaXMHabucvMEKsIhbYQ
         NIkRvUDp1HpYxJaoyC9Efxanvr2WhlQ2EEwqjg6sRMAwLE84x22Owoiw23VehDiGAlEb
         TxN6v+ATZigr+KrYw2f1NByhMrPfEiCNpWYEd85H2ldetvonIUYT+M7kplYYTTjykobU
         XoiA==
X-Forwarded-Encrypted: i=1; AJvYcCW5y/pv/a92rJJYRGjEgbQ1DDttjbZZ6ivizeVyVJMcnDpyxdaGS2srhL59vUSAHlZrRCXT6ctnTrEb@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy6a+gn0/zapX9OBMPYtBT4RstLtHIbbYljgkHMWO9IrYp6oAhT
	pJM/SsSGZuFkMtj46X11KKpJjRZB8Ggr/3xOPk8G5fdu9jU9h/RMFlYS
X-Gm-Gg: ASbGnctdUE2tFiVAbWe7OtFmVsTpsD5PxyWT70CHciLKaErPrhw1n5kbOhzWnvv/eBi
	kIincnT1gwvEEd/onJvKcyeqIwGkGCGSPu7Xmc9dw4HeYDgLtMJEWGhH8bvQ1IqbXnivb2Fq5jx
	D5P237sHGOZUY5oM2Oma383cnweBmzkk98mR+S25DE4tQzPkKjX7QF9yKyJjmuUtc9qRkupLFWZ
	LfXBA71KonXF8P6vVCJCbOXsFJeAHW3fp9WuKZMkyEkzPzn/tTamV9w9HJsCQKjxAXcrcHTkG/F
	wH7k8MhYOaPop5oEJOvnwjtU31la2MlNCkFDHFjov+jqoGyO+JlMTZjz8/tStBQvREWFqxydXPG
	nbPopaXcEOyZNoud//kYR6pOx/dLp+Mbkti1u5CmJ
X-Google-Smtp-Source: AGHT+IEtE+sLJ/l9Jfm7JaiF1fYpyMVV9PhBGBMQ2H0UV0Mi6JbllI7aH7Kqq18B0Ua9aQ0IxOB0Jg==
X-Received: by 2002:a05:6402:3552:b0:62e:ed2f:a660 with SMTP id 4fb4d7f45d1cf-62eed2fa993mr2339876a12.11.1757724067127;
        Fri, 12 Sep 2025 17:41:07 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62f0c7a5546sm189920a12.43.2025.09.12.17.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:41:06 -0700 (PDT)
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
Subject: [PATCH RESEND 01/62] init: remove deprecated "load_ramdisk" command line parameter, which does nothing
Date: Sat, 13 Sep 2025 00:37:40 +0000
Message-ID: <20250913003842.41944-2-safinaskar@gmail.com>
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

This is preparation for initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 arch/arm/configs/neponset_defconfig             | 2 +-
 init/do_mounts.c                                | 7 -------
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 747a55abf494..d3b05ce249ff 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3275,8 +3275,6 @@
 			If there are multiple matching configurations changing
 			the same attribute, the last one is used.
 
-	load_ramdisk=	[RAM] [Deprecated]
-
 	lockd.nlm_grace_period=P  [NFS] Assign grace period.
 			Format: <integer>
 
diff --git a/arch/arm/configs/neponset_defconfig b/arch/arm/configs/neponset_defconfig
index 2227f86100ad..16f7300239da 100644
--- a/arch/arm/configs/neponset_defconfig
+++ b/arch/arm/configs/neponset_defconfig
@@ -9,7 +9,7 @@ CONFIG_ASSABET_NEPONSET=y
 CONFIG_ZBOOT_ROM_TEXT=0x80000
 CONFIG_ZBOOT_ROM_BSS=0xc1000000
 CONFIG_ZBOOT_ROM=y
-CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) load_ramdisk=1 prompt_ramdisk=0 mem=32M noinitrd initrd=0xc0800000,3M"
+CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) prompt_ramdisk=0 mem=32M noinitrd initrd=0xc0800000,3M"
 CONFIG_FPE_NWFPE=y
 CONFIG_PM=y
 CONFIG_MODULES=y
diff --git a/init/do_mounts.c b/init/do_mounts.c
index 6af29da8889e..0f2f44e6250c 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -34,13 +34,6 @@ static int root_wait;
 
 dev_t ROOT_DEV;
 
-static int __init load_ramdisk(char *str)
-{
-	pr_warn("ignoring the deprecated load_ramdisk= option\n");
-	return 1;
-}
-__setup("load_ramdisk=", load_ramdisk);
-
 static int __init readonly(char *str)
 {
 	if (*str)
-- 
2.47.2

