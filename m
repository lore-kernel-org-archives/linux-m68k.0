Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8403815E5DC
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 01:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757725578; cv=none; b=OHuvzECKcFRV/j2JDGEse+vmEV4I3mEVkf5ggL+e5Vp3Nu0vKYBn7z/q0DztxMObF0Cz45xH5JEKol6OMPjLRQbFdAYnQN5wx6q/HzEkp1NkS831znefHKB2O0C5aURgfh6eoXU8sEJxA9k8N0AqyzIPFj9hU8y9VMZlC5de2Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757725578; c=relaxed/simple;
	bh=vklOel+wSCjK4qNA3bbVH6akiUZ5v6h3w1mLbg32yHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=acIfRftrRrmjunpVXH0kLUnVZkVteuZZLBkxKoOVAGQLUlcoCbXZob74cRIbuAKIWM+jDy0Cf+N/E+RsrSAkCpyqugR7uk575qgMw/1eBciZ79RCp+QMuLTS3MyJU53eX0ZG0SxnzeMwCozkuuSSKmKqO/EwpwcHdojurzYRzWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKnaXORU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKnaXORU"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-625e1dfc43dso4278903a12.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Sep 2025 18:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725575; x=1758330375; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRKyxFwRI2Qz0k3ZoQpZ3VLrtZiB303jicB3H5rLu1o=;
        b=MKnaXORUNSTfmUKsJ9n5JNQRCZk3w3yk73XDYinNkRF/eGXKe1JYIrBVeERaVKRLmo
         wbO3pWGO9WGYnbLG8vU6jqS+Hcp2FclgAX9TE56bxw/KJXcAng2b5W2mpEn4GAXp0a1P
         cm7j/iqfBoq6zSfW8oVaR8Mm4/82rxPyFQ0tioOFAMxMn6OKVuqB3NhTAgNrN8dfAxTm
         FrfGKaIZS2kLhJXES+Gv3MG61Xi7Yi19P8YjpW9BJPn/Uf1l6a2RwLLo4kZdJD3TROQu
         Ho1YRGnPSn82oGh7WcSOp4jSJhrYUwihbYenuEonE0oSr4X/0n/prMMKPTZOyAkU9u5+
         7BYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725575; x=1758330375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRKyxFwRI2Qz0k3ZoQpZ3VLrtZiB303jicB3H5rLu1o=;
        b=kH+ZpCleXMuuXaV/IfxCVo+81xDT7gYZnTeyfj0j67rGxal9Z3bjvhiv4Uu4/hRGYF
         i3f2nuWMHqjfCocqo6Mybyw56ubC99ni8/VMI8GS6d2KzDRT/j/8Ed8tTyuy0kmTbCGc
         MjqEZwW8uXzn6CPvAVbw9BbIahUc0+wMpWlavPoCHtTrnvBKDqt53cDzRnNIYN0q0Pwo
         cCKFkiKbwdMQHXJhW90Ye4AIr7nE9ttMKZB0i4fijmJmu1aza2h7TL02rgv++xILkUw0
         OojsG/tSZD//jFEtL0RQZDiwHTAdGg2hlrOggwZoAh+nslPN38AiQ2XVXjz+y2B71Q3d
         UCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmr4PqmZdXH2xstC5EVHKd4k8fENnB8OKP/emRK3ee8x69ST57PHfkgNPyskFw4J/XdJ19fHYFZ8sy@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyhwLMY0dlZ4o7/rtkZ38JTydDzoc/+ATFFaTPJ6o7y4F4ki/WW
	2zNvD0ql1zzSLO9dJccTj/9vliZfroRy4lz85299cORiUis/Qy9uuXja
X-Gm-Gg: ASbGncvpBEMTBpC0ema9X2pt0nDY7I26xzivEkzd0lRCq0ibPo09oLcFCtKjw743lR+
	KiCrUQVic6BrilgVbOOodzFJxhmVPPNfIF+rLhN8nLIuZbkpSxslulfHApSeRVK5AH4e5hhlT+T
	9OnoRhoHekSmZr39Tn+voDXovrBwCUB2ULV/rOtTk8rkaoggiCbNI82v6HBz83ZFyXKGAudkkKa
	AewSM4tz01xssxVMUAfB1qEzAhiWyNr9eJWdf6M09g0A+HGT/EkX1UdSXL1PyKjyn5MHUOLldXX
	h8xtRZCx7yoeyOWoC2xM0r8MdVqQC0aj6t10fcCg6g7T5M7rm/SkKar/qsSQTqGDNRU9lcBX5PP
	V/1dTr4iMep8mW/1AHE8C4CXzydyJHA==
X-Google-Smtp-Source: AGHT+IFUls6LXsrCLze7uCxm9gIrKR+0qjIy+VauG9zkpfPwn7RwHzjJtZF9/Fq3L/RMfRZn925KxQ==
X-Received: by 2002:a17:907:c09:b0:b04:35c3:40b3 with SMTP id a640c23a62f3a-b07c384b024mr492655366b.15.1757725574734;
        Fri, 12 Sep 2025 18:06:14 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07d9e18c24sm112553466b.61.2025.09.12.18.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:06:14 -0700 (PDT)
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
Subject: [PATCH RESEND 24/62] init: remove wrong comment
Date: Sat, 13 Sep 2025 00:38:03 +0000
Message-ID: <20250913003842.41944-25-safinaskar@gmail.com>
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

This comment is wrong. free_initrd_mem may be called
with crashk_end and initrd_end as arguments

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 include/linux/initrd.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index e49c7166dbb3..4080ba82d4c9 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -6,7 +6,6 @@
 /* 1 if it is not an error if initrd_start < memory_start */
 extern int initrd_below_start_ok;
 
-/* free_initrd_mem always gets called with the next two as arguments.. */
 extern unsigned long initrd_start, initrd_end;
 extern void free_initrd_mem(unsigned long, unsigned long);
 
-- 
2.47.2

