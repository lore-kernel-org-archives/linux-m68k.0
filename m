Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39062272E62
	for <linux-m68k@lists.linux-m68k.org>; Thu, 22 May 2025 22:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952772; cv=none; b=lJGndOtSrmzJhL/If4JWWJBW1HAqHsct2zSU3biwbLMsK9mH2UmqLrBymWNh8OPSlgAImdeEC0ZEZaV5EhdCO7VdwBBUuOz4pfH5O9tucfEQei9D4zgbJO/74M3Zb4EtSyHSnpmGpPYHnBQK3lxDQgJX9OgTj3Fq7GFAESJvhLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952772; c=relaxed/simple;
	bh=ERIIFgKxrnPwjSVA6jXYtUfeYroUqJBM9v+L48OiIjw=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=P0+HMMYHOxHi01d/oyjqOdVCwJpj2HHe1RH83pH3L+fDJmv9ttCcV6KnJLWCluJ/drYoL94QkCmvrPRuhp6r5BPs9qMvhTfsnY5Yh0I/CwehFKXDTS2bNzIFXrs4VKAyW2JYmRoMrs7YNM7fDMAlRe5zatstPTe6YPojko3LXhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=HQ0T9PKC; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="HQ0T9PKC"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c597760323so963197085a.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 May 2025 15:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747952768; x=1748557568; darn=lists.linux-m68k.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yW4BwrWRPMGZw+m/ri6EFRKCjP4k+SeXSk6ZWrWvJiA=;
        b=HQ0T9PKCUM7fpHUeXdo0dZrPzQ7yJXChL0R2pzDLtC4G3EsX97U+sSjDsk5PsTWux0
         VEpDSyq2BSA3DY2HHRQTFMP8Zs/8jghmSPUi6E5+J95LwDXY4nSlA9jKijBmKaFCepzA
         hSCXAdlDNQeQKi6sx3Mq8yyBpzEVKn2Ic7FIDrKFH9e0HNR77jFb9vjHAhkwnXkg0Cd4
         G+wunLRj4LPeA6lfsX6BMayAALAHsv3g9QentjegSTZvZNvfZvIsVLpWozpSo7JjcQNu
         0QV79F8rDeC5HzwnNL/aW3HChkoVQShLhN/+QGKrMsnjKX7saI5cA33ifqMzLrtmvU/W
         0pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952768; x=1748557568;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yW4BwrWRPMGZw+m/ri6EFRKCjP4k+SeXSk6ZWrWvJiA=;
        b=hOqWDt3McrCZyONpiUX1UX/3oJn9vAn1+ytVlSaXad/Ks6EK3BEnd5nmmVLHJWGyyS
         eemjnma34rqgCufjUlgsxjjqe53P50kwfR9KWZFt3xLIkMpndj+XNBwn434P+3gE8spT
         38FzKmI+or9gvQ3vO9o1Yq12w6m0AwcINjNZuQwnk7U+lsPLM8Exy0Avffjfu/uodQza
         Hw1lQl6d0TkJJZCIY7Oor1gdb7ikURgSRpb4P044lO1bn8A39iqCNvEjt+hxqFazBjNC
         6ME2RuSUynISB99KqVHtKaQTragcIVUjooGlU9NV0AAV+a9/Qn+WG9GfSc7Zdsa+TZt2
         yfHg==
X-Forwarded-Encrypted: i=1; AJvYcCXSAE7qyA5DJstFFBfrS6JYo3F6eDbczc3sKP8TMu74d8+CfAMQf342s6P7i8Sv1CJ6KlZmrD9xIlGq@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxSNzme8geyljf4LhCHlmWpno0eNku7QAMuIuBMrUZmXw3Kpici
	/nt7xQz7UQftiYDtj7neSbCXRemMu9Js1xlQPiUttQMpOJ3yXwM5jJn7ynLoHm90WA==
X-Gm-Gg: ASbGncsqCqN/N0Oj8ci7YfnoZ4bz7i2+q6YwxhBjRS+mIq1W4qMVeYteFY98lRNJXe2
	2stBbMdugsf+vSb7NjK5wmNrQSv+Juv2Bq4rd5FreLOVtvS7BTxiafMEIJ8qEsqaBQwa8rDNmoW
	eJZa73GMAq5y5afO/+5IqmR8auDlL6fv5/pUmEoILLANeykmGWHVQzWt+kjxQufC0Y+qtYiK/2b
	mzKuHEPsitLcHRfB+NzqJxAUj50yQf4otTpK5eYpFPyH9gvq+MHWXQrV5Rh5kOMZwgRcpd0m+Jt
	MSAJ7AnzEfOzuxoFOasqdTJojANlWQP7jYI57oH86jTKVr3zvmJ2zoZMe25e7zbMQpQrXWSXEmh
	1FdCTse3/HDIED6wWgDt7
X-Google-Smtp-Source: AGHT+IHmIlyqjG6e3vdHM+wi0UqPbDaDdVTY/IdBlClNAbyXhci/B2Ul0PB2ozu0sL7+1EWeTaPM2w==
X-Received: by 2002:a05:620a:408e:b0:7ce:d352:668f with SMTP id af79cd13be357-7ced352670emr1334278485a.47.1747952768087;
        Thu, 22 May 2025 15:26:08 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd468b69dfsm1089029585a.79.2025.05.22.15.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 15:26:07 -0700 (PDT)
Date: Thu, 22 May 2025 18:26:07 -0400
Message-ID: <8bf36078ef8f3e884a1d3d8415834680@paul-moore.com>
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
Subject: Re: [PATCH v5 3/7] selinux: implement inode_file_[g|s]etattr hooks
References: <20250513-xattrat-syscall-v5-3-22bb9c6c767f@kernel.org>
In-Reply-To: <20250513-xattrat-syscall-v5-3-22bb9c6c767f@kernel.org>

On May 13, 2025 Andrey Albershteyn <aalbersh@redhat.com> wrote:
> 
> These hooks are called on inode extended attribute retrieval/change.
> 
> Cc: selinux@vger.kernel.org
> Cc: Paul Moore <paul@paul-moore.com>
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  security/selinux/hooks.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com
