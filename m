Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547F47DA6D
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 00:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757724531; cv=none; b=G58IEWbtsYqS2B23G4lP7JFKH9tE1iAwN04rsg75LrP2dGiLfHGSPj8LtsUu6LKDxDfYHaHiXF/Qow+WQAhCv9wxhGcRPe5CszKlWoXf92OrVJkpnXW/+fQdlbJF87StooYRzGT/i+rrWyS77EjRW9Iq67QwwvdXlWt98Et78NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757724531; c=relaxed/simple;
	bh=xKqULWXz/2FiENcJWmfzamYmMIE4imk3W/BtNdWBiQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YGlugMvamI3Jv/uyBmL9HGBvddcQWPjdnBzkJ5Ojer+SIRyYEscQKUYbiHqiCBVU6rGEJ7yYYeuhSxIFHH+t7ESNCtUwTTJbuhr+1+8txsgMIwFIhoSFiOauGgJUFZqoSDX55/Ua6wlobakYWhGWDV0HKmouQJvfr/kkVpxzi7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SATN6tod; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SATN6tod"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b0428b537e5so362236866b.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Sep 2025 17:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724526; x=1758329326; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaXPZ8GS+1OiGE0ZCje70+VbQ3y123W+k6t1ILETLlQ=;
        b=SATN6tod37a7TmoR5P9OOkysNa8LbNQyn065m3E6GUusSHVQp857qmWxZzNe0OJaic
         6EDI7btmy8M16ONq1YMoLYOgRGUzh/+g91JKTz4vd1uzSAar0uop9spe6sbklwfMdUHM
         6dqbwvATpWaJYPbE0ctt463OptkWlR8cSOSEzGCxx3kJgqyUnd25gjBupW/cxOakFsTg
         eqACdKdiRQV2iImwcApFRQWkINjblMIYp+AJSJVCxOpIgWWDlvNYeY0wtOz+PjOCbBZX
         QjfPzd40uJ5yQzPuE8YcbrgNUPDjssEloZc6RXu05/xf6xDI6pKpBm6zLqSBNwIS7YRC
         mnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724526; x=1758329326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaXPZ8GS+1OiGE0ZCje70+VbQ3y123W+k6t1ILETLlQ=;
        b=qqpaNo2sCc2JFulkRz9PZNxp/2iKK3rKK+9u/WRFZ/x1FOwt67tlUqiGHjsbB9DHry
         vMmgsGDgq8k0miH5EN7OW6rzJDADl8GMQdUIi1zpfKhjwd/8i1aaPTNDoDeKFW8WN/w6
         bC/ZHys+mJ7kwCAjAwy1AuE+O1/hCRXV5tshjFGBqV8ZEDnslG7Eh1aXXYjYv2kinWfG
         ly5GGSq6foIENtKQ7ZF27x7mAYQXUeiuoRssm9wAkDFDZXZQgfdzqSYHU7oZW2m+Ykga
         5ekYT0jBBGOOzACTxOzbsQst9jBiNTZcvaEow1hfuToSY1vUtJLLb/4Dp0Vr85LBbWSz
         +3jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP1ydJw/PrAvomiyRU4hLt787RLp2uJTuYgarP68n0o04ssXmfiyOJq1tMm61TU/l3TbLWy7k+liyB@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz/vZQj6Z3YG5RtZ7WnSk7Otig5suf2Zh6s2dWxJEfVAXkgFY04
	jmowPG+Zz+RDknRnBZoyWckYXx31Odg+vauVdpin/K3yy69HGCRQ7rcu
X-Gm-Gg: ASbGncuC8VB/84MenKuOlV+1YBoQxKLAJ8zbfOniAyRYJB/xAHDe1Auj4CLRpY0A+px
	rMf27PMBAqVbQdT2yg4YqWsaQ51JiO/HhIYiGTFtMPrhXzsaa2uE52s+NW+HVsxxplJ4Iwo8UCd
	i61kxYzJa68I4j6WSqZmyhcKZW/77Dc7V8RpmPFr+zFKbIGGTpJEyKaIJwmh740b2In9044Xd1U
	PfjdGQk1TrEd5llz+yVh6DJD1yC6oyI73bRBagvSm0glf2+NnfS1w8uBW49FDE5oSVZYD8nSX14
	Ehsy1xui9+e0VKlpiLdjpM+nt2gXGkZRMyZK4CjXTkQ44IQBTMzZrvd91W+mNcsOCpoYdV+oIWW
	3DXGFGRKMweDvmMMbCaw=
X-Google-Smtp-Source: AGHT+IG9OWg6vz1Y30fO80tUWulNMPWiUpAt7xVByuYcp52he6rblxs++6dTXTQkGfdvR2czpiOABA==
X-Received: by 2002:a17:907:d88:b0:af9:add3:6bbb with SMTP id a640c23a62f3a-b07c35fb469mr433586666b.29.1757724525627;
        Fri, 12 Sep 2025 17:48:45 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd5bfsm461777466b.63.2025.09.12.17.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:48:45 -0700 (PDT)
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
Subject: [PATCH RESEND 08/62] arm: init: remove FLAG_RDLOAD and FLAG_RDPROMPT
Date: Sat, 13 Sep 2025 00:37:47 +0000
Message-ID: <20250913003842.41944-9-safinaskar@gmail.com>
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

They are unused since previous commit

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/arch/arm/setup.rst | 4 ++--
 arch/arm/kernel/atags_compat.c   | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/arch/arm/setup.rst b/Documentation/arch/arm/setup.rst
index 8e12ef3fb9a7..be77d4b2aac1 100644
--- a/Documentation/arch/arm/setup.rst
+++ b/Documentation/arch/arm/setup.rst
@@ -35,8 +35,8 @@ below:
     =====   ========================
     bit 0   1 = mount root read only
     bit 1   unused
-    bit 2   0 = load ramdisk
-    bit 3   0 = prompt for ramdisk
+    bit 2   unused
+    bit 3   unused
     =====   ========================
 
  rootdev
diff --git a/arch/arm/kernel/atags_compat.c b/arch/arm/kernel/atags_compat.c
index b9747061fa97..8d04edee3066 100644
--- a/arch/arm/kernel/atags_compat.c
+++ b/arch/arm/kernel/atags_compat.c
@@ -44,8 +44,6 @@ struct param_struct {
 	    unsigned long ramdisk_size;		/*  8 */
 	    unsigned long flags;		/* 12 */
 #define FLAG_READONLY	1
-#define FLAG_RDLOAD	4
-#define FLAG_RDPROMPT	8
 	    unsigned long rootdev;		/* 16 */
 	    unsigned long video_num_cols;	/* 20 */
 	    unsigned long video_num_rows;	/* 24 */
-- 
2.47.2

