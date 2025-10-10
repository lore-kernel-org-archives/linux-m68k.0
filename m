Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C8D1DED4C
	for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Oct 2025 04:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760069383; cv=none; b=JJkoVR7bKTBxTonnfL0k0iIXnNlAElMpOK3BW4sN7phr1xC07vbnT8hBL/QzIxcjvYX1PGuObJee+hPbLFpjU3xm7bc7c2W9Apg+jueLD0kMnmKxR8/rBk2hpKBg3QRNctiQ6aVh2yjpMHXLNETNM7HCIf0jYssDXnHdpZQ+MfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760069383; c=relaxed/simple;
	bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CAzb1aUX5x1pklch6k0egCX9K+higcPLyBu9M3v6ERGUAfM6ui/NBLi1o034Yxu8OMDTyyeKUG4tk5J0nYavs+rM0v2lXxbAIKByWAUcugqJ/sL1EyAuW9qSMNG8zWLa2bEkN4k8Jc/6hAMlUuq1Sl2boRnHTlotbmXyEPtMH+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQjvaWRl; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQjvaWRl"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-63605f6f64eso1461983d50.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Oct 2025 21:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069379; x=1760674179; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
        b=QQjvaWRluef6krzgBfj2WLwzvmNBX5dQy/Btjk3+6mEgrx2qwe4Z0SfrLbeAr6wiKO
         70G5cIzii0k1Syr5CgUkvesJ9BKopbqDwI9LqQZpV6xC6xVYiq+y9jF/9GPpjk7ju25b
         zFEpVryPaAlrnH9cAj6qL+ALhGjyob4REWlhtUl3SjrrJlJvi4A9P8GSFIM7KwKxrrsV
         Y7fUhDKzI7CXURL4EjBPpwu2EsD8pFOvgQ3H3BJySZVTfHgnOqNIVbdTv3YhJoYl3xOk
         hoGQgkNikp6ps2j7VHEoTVfyaUX2m6RNqUf+jLpb6RcXIpZ68F42rccryMVbAJmsiO15
         mTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069379; x=1760674179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
        b=iZwUCUQh19vIfKNFB0s4XvhGXx8kcqWT0sfcJuTloNd5XQozBSBtpPDgYqiRk5Whiu
         9C8MKtrZXsrBS3tluQSOrUGast4lwcirkejgAmQ2ETdyjWDe2+Gm70CBU9Qk6isr77pK
         sHCbVOtl2FvJOzdFe0BlZCZ7zM7R4rW74+C7hctsIQ6a/8OijQITJRQdi4alATlvLOfm
         XDoy7OkK2OR9oa++n6M1DnbxG749WE2m9BUra7fLcEdVB+mXTnRioJxJjY9EDayxQz7N
         ue9dWgqs6aGgFPsrlGeTewK3iZwA1oPqLaE8P9AtwctG43lyUfSlcx7rqRva8E2H3OAZ
         Vdpw==
X-Forwarded-Encrypted: i=1; AJvYcCUn6MtX4t6iM3XnXL6Kh/EaKqUS2Z6cxJExdCrbZOYEfdkad2RbxQgZkzzie1x4JJELzsazqZl4f4j7@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxacq+6BUfflFaVHl1XlW2uZVV21gwDcSXcCmQMdSfSwv0VeIH2
	UL5sTaYT6vaWvzm9efDzfremtYwn+AjGiJbUsYldCFDDvAwNbJ6PFxcvOyNU9ThIbyIZUAm2S61
	eWX3KcJAKO2Zbnaa1NFqqqwiZF1J4B68=
X-Gm-Gg: ASbGncsvgAkBKnykkjdIrUOIFau+8NR/YP33ZS4lxKSSXi+Dp7uWCludDCJVBoL3F6n
	t26V8D7JucF9P/kaHYyK5gmy8+jUqnVm1UZZT1Ug/SBypE3N1ixHgHV8aIRtNeHVOJiaPj76tjH
	WCoo5yRTCDed43bE+Mv4wv2QVZ80qEIBKT/PnLWIROrnB5UyJ/emiJu+ZavGXk5MmgHrelr1dsl
	HMwVyMOM1a54ArnrUfOCjqGzZkFq9WN5rSK
X-Google-Smtp-Source: AGHT+IEKzDZJ3mg1FFWOqowFJqWLj/+dmJPdM199pmmtVcavFH/YLuoH0hEdsvn7dHSOiTNw/3Aomiv0DcOjJivXzrY=
X-Received: by 2002:a53:e946:0:b0:636:17d6:a30 with SMTP id
 956f58d0204a3-63ccb82410bmr7618496d50.15.1760069378763; Thu, 09 Oct 2025
 21:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
In-Reply-To: <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:09:02 +0300
X-Gm-Features: AS18NWDxe32nrD4BfQQFhIe3tEEfxrwgJsYQo_BWhSUPsy5CceSv7QOcZ20roI0
Message-ID: <CAPnZJGAKmgySY_RK0kmGTgwUh9hw4FSrVR+LoJCbD_RmJZe6RA@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 8:08=E2=80=AFPM Jessica Clarke <jrtc27@jrtc27.com> =
wrote:
> I strongly suggest picking different names given __builtin_foo is the
> naming scheme used for GNU C builtins/intrinsics. I leave you and
> others to bikeshed that one.

Thank you! I will fix this.

--=20
Askar Safin
