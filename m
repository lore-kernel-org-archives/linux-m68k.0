Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40140270EB1
	for <linux-m68k@lists.linux-m68k.org>; Thu, 22 May 2025 22:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952772; cv=none; b=ot+RrBhFL+unOEKqX9SdgnknGy7RDdzTu+v3l6D+O/Z5kKnSVyKWn+hkBq85mAOBa1xhLzSJZkBNuwRmZ0TPuR4+adeW8kP4NfH04Z6HMspsdGD6npttN33fmIfv+ZIn4HyrD+Sy2ybxKoS850bVbDv0aUoc2gtNjdqKXF6GTqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952772; c=relaxed/simple;
	bh=yXfmq+fsOH2ydhYAaJ/O8G8cyrnfKS0KGUVUMAH0MGk=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=E0gE8tFdEkLx92qrRnNfjAxb7jjO2Z5F1Zyv6ZPuTMTSGubSpWFy/zOwAZfutWDCQNf1tDFyadp9vHB2OQVmnmsqqbRj/vlRkoLlMYSkvwsQqGpTJQjtNxGASkec5dEqDrNO8iJ63Gfl4RSLaKBmluq+HjPWar0JmPtBaEgOXyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=HMCVqueW; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="HMCVqueW"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fa8eca392dso9928686d6.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 May 2025 15:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747952767; x=1748557567; darn=lists.linux-m68k.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jmptf5RMBQqSn8lkxlWoyMCjmS+Mv7H8iKTTl/Kwouo=;
        b=HMCVqueWBGKjs3+JjHimxY6LQYD6wjcYiQHnpSJPpbDamohRt4MpGq07wI2mzahTHX
         nJrOeZAc+FPwhzgHCWs52a6MyNsD7GgTwxU+bmp2Vj6hcLXvWAgqAI3x46epskiP2/WA
         bKkaAnmKORjrQ//hbMwoue3VtwtvEaJSk5To9gBMP6J1rNG48WwZMN9KBeUf3oIb1ZUc
         BmyZgF3OPwx3VNcRwhNL2a+0+W6YhzDsvpEhXAX+JVpc+m4Qz3Q5bjgU1ZFX5QhBrD6C
         +vHnP1ICERxK5nNCammkyPf/hll/UbKw1A+BWvqYz1PdziMf69RrHSsR3fbNv+xGvGt2
         7AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952767; x=1748557567;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jmptf5RMBQqSn8lkxlWoyMCjmS+Mv7H8iKTTl/Kwouo=;
        b=VoogMI9eHP41YvOGRlEqCWRvVghW72NTV16JD83+CF2QJKRNvnflbADOLAYcTLAqsZ
         n8u5vjYKHLm6l/8I06cW22eScy545h/c8rXUvON4Djnsc8NPEyU9/1xZtc7WWXAwsJ1d
         JxZmv3LCGYRqoD+HvTw38onXXfuROgybGJsoj1axoUBTsSX3lxtR+yScE2YeTVygDXcL
         jcFttpmbyi3M+NfDOfmPhByHcZHaa9sFkTAvFPFh2q20DRyKc2wHequZiCGlvBAlVMCO
         0hiU4Ai5AwfM/0mag/L+YODyyA1uzR/XLwMsYPfFhV5AQZTwHMYUeWGCAZt4xPKkuwkX
         gxjg==
X-Forwarded-Encrypted: i=1; AJvYcCV7pTDrQWWYwy1O1BxmuEigUtRzuzK+C+vg374w9ZVw+e41voTSIFMO/FbHsJfNm9pk4RmgfSZY+OF0@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwGIcM5Mcb+XOePWNnOyK+P/s9qXtVGggsNwbLvFIX/JUbon7gb
	ogDHVGUXNSFzmt2lWwt76+kELs0tUvRgjRMhIgu9LUkBkePi0R86Iv8CUG5Q33XTpA==
X-Gm-Gg: ASbGncuiB3tKuv1MGRYz4OsDqlM7ti4L9g/VwRs5ZFB/rwkwWFjs+a0iLFIGHUrgVyL
	y6MgwKApBmNHi8urDzuqVWbPVBvcikiEgcTfB+kOe4FEeG6SYRlCdp3NK+hvFfhQVMZzA+RsXqr
	CoJ1qI+UCyV8EGlWcWtKXkGxhCU/bHljRak6XyT+KVrjGcv3fCA1lKCqOyfb3//jgQEOT+f9MTg
	djFPZgGR2t+E9d/LDyTLREmQ9s7IohJ0WApykMXbOo+Vy1wa6pJDKGBR66ElhSUpWnnNSz5zqSC
	BpcENESc3OPpzH9jZQ+oiNIRnP/WLPiTrZCwkZq4rgeHoOzwVudSBCFd8p7oHIm1RcIflfsYMHp
	GewyYW6tbp7njka1/3klI
X-Google-Smtp-Source: AGHT+IE2zN7SH+0SaGrs2tzepSFkLMKNXBgIbbn8M9DQcRbDJBs1dDzlx85ZuSxbIPErdUE31K4qXg==
X-Received: by 2002:a05:6214:1947:b0:6f2:b094:430e with SMTP id 6a1803df08f44-6f8b0829131mr503375636d6.25.1747952766984;
        Thu, 22 May 2025 15:26:06 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f8b0987259sm105076766d6.120.2025.05.22.15.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 15:26:06 -0700 (PDT)
Date: Thu, 22 May 2025 18:26:05 -0400
Message-ID: <0bb73a49ccbc93e90ea87c0dbb4097ae@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250522_1740/pstg-lib:20250522_1730/pstg-pwork:20250522_1740
From: Paul Moore <paul@paul-moore.com>
To: Andrey Albershteyn <aalbersh@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Tyler Hicks <code@tyhicks.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Amir Goldstein <amir73il@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, selinux@vger.kernel.org, ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 2/7] lsm: introduce new hooks for setting/getting inode  fsxattr
References: <20250513-xattrat-syscall-v5-2-22bb9c6c767f@kernel.org>
In-Reply-To: <20250513-xattrat-syscall-v5-2-22bb9c6c767f@kernel.org>

On May 13, 2025 Andrey Albershteyn <aalbersh@redhat.com> wrote:
> 
> Introduce new hooks for setting and getting filesystem extended
> attributes on inode (FS_IOC_FSGETXATTR).
> 
> Cc: selinux@vger.kernel.org
> Cc: Paul Moore <paul@paul-moore.com>
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  fs/file_attr.c                | 19 ++++++++++++++++---
>  include/linux/lsm_hook_defs.h |  2 ++
>  include/linux/security.h      | 16 ++++++++++++++++
>  security/security.c           | 30 ++++++++++++++++++++++++++++++
>  4 files changed, 64 insertions(+), 3 deletions(-)

The only thing that gives me a slight pause is that on a set operation
we are going to hit both the get and set LSM hooks, but since the code
does call into the getter on a set operation this is arguably the right
thing.

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com
