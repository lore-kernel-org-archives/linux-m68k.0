Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C701DF252
	for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Oct 2025 04:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760069264; cv=none; b=HLWRf4A4/Ai4uAp4nIIhWLB3SHV58cF4hiaQTMFydX/se8V56fCjn55xdz5FoK6gmHXIJkdGrhYgS/utFH0MlykOOT/KV0Prj0drdESz6+sMI80IPTNOIjCHR4dKOKFKSwUoVkFSAiUtLmdPf8EjbVN7Nwdt5raeIJVTZXbcyZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760069264; c=relaxed/simple;
	bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujEVVP2R7HVUPxSl+ZGagf+Or0foZzBIO/7j3peaKmXd2JdOUTcoy0ZwP8JOv2qXLvvbrCJLk1ns04epRaNXDm+iwaCkCa40cQRuZ15q5Jbaw2fqIf1R/7n67DwiVO66x0zTe+s0kBPUOdel/smorWET4XmqTwKhvlQb8jGHzt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhupEip+; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhupEip+"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-72ce9790acdso16383487b3.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Oct 2025 21:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069260; x=1760674060; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
        b=VhupEip+/xUSSNvlAFxoTNdhFss//bPLvFKBdlFqv1GkjzTNrKsq8S0q4C0E4Kzg8X
         t/Qmz+PDwnjm6ZtaMKVZOmPB+8Z40CboaFmrPUzGgLfhuVhe1HAMHk+YhqJ8DlPWkKsE
         9EqofNPLDHBZe1hxF0T+x/7WXm/umCu9sfhXppI7dCVTmbA2PoIlC8Y+7xiFBXVw99ym
         YfgpWbvGID9PTj8iBNPilxLqiC4rFPriJpzxcc18m4Laar3CQCGQHZeZSa5OICHXkjZw
         VMzWFJFwkkF762eq5hH8EOyWNsAJPyvepnwwZR0dKjyKCliJXndo5P6n/lvL/jDqKbkI
         GNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069260; x=1760674060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
        b=gK8ceTU0FPlZEwezlUCSL7PUss/5LudZ0VSugQaLulcD5dTn3KxfcBYnOkhjYWiGup
         iJHi21CDFv6z4KIGyH14ba6SmHSVy47iHnStAjvyPZeMOjYDjdAvwej1A2BbOpvxU08c
         o6y6xrJ807LDCO0cLLlZJF02stQKlM9lHDtPPkCQ8ba6S49kgjYZKVAttzxlhclNZ8mG
         tHhlOndiRndAT/lJP8nc/1LiTcCHPwzrpOZrUgs1o8cltr6DwKMB/xapI8/HYT/RknOI
         236aXF5+8pBLI+PNau3MoVW6Z8R82rncVzn0l/buSypH8qiaO4+zjOzEyRXs/0yZzkmK
         fMgA==
X-Forwarded-Encrypted: i=1; AJvYcCXv0k0huLuSqh92uZoXi8x+yGKk2PGZxGpGJWryB5ryWiJ8aDr4DrJA01jCHL7pQsff3wkCmXYBg6FM@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyWvZKoO1uGcK67gQYKZK9RbfOUHb491xEm1LPjz9st5nn5lmS8
	Z7ekSO+tXEa/DJfjW6+QLaVvirW8Qb7196XboKTMn/hJdyQYaMQjBLZ4WsCYO+Xhm9BYBApe2Vh
	c0Nd0+5sGrmZ5ZECSTzHO5qT9pKtIW+0=
X-Gm-Gg: ASbGnct4jY6YaDnJLWWbUIzNT9h8CaNLjUeTwJ1LIaC6R067OM05gXbiTaHe6Mukzg2
	ke+zYqOU3F1s5UcRvz+QLlBq/wF+2dSUa8f0MVVO7DJhUcbdxAQncOOHisYol/83CZ7fT+TwcVn
	E+5oj2TeXperUifaUcMA4YH9grLRmiZOnFXvHNAJ5Fy8sGBE7aFMNo8s1EZwYfO/F1i0J8zB2N3
	3GLa0AxxQQFmVJQnASo3Alntg==
X-Google-Smtp-Source: AGHT+IFQERg8mTh7nax6OaWavJ8DgllCOHm5p0zLQR54uFFNlwqM0wGCA+Q/Rj/bdvDMe/rRbnhyAA7hAcefbtq0UHo=
X-Received: by 2002:a53:ca49:0:b0:633:a883:3d1b with SMTP id
 956f58d0204a3-63ccb87491emr6995599d50.6.1760069259733; Thu, 09 Oct 2025
 21:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-29-safinaskar@gmail.com>
 <20250916030903.GA3598798-robh@kernel.org>
In-Reply-To: <20250916030903.GA3598798-robh@kernel.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:07:02 +0300
X-Gm-Features: AS18NWBct1j-7S8OHD6pljCYd2aEZxR7vcCRPjZz3T1pRcQcUgdDoCBWxEfbyM8
Message-ID: <CAPnZJGAvQirGTJTiTxumn8sAJ5KYDv8+MUTBmEW2fYX+r2RE3Q@mail.gmail.com>
Subject: Re: [PATCH RESEND 28/62] init: alpha, arc, arm, arm64, csky, m68k,
 microblaze, mips, nios2, openrisc, parisc, powerpc, s390, sh, sparc, um, x86,
 xtensa: rename initrd_{start,end} to virt_external_initramfs_{start,end}
To: Rob Herring <robh@kernel.org>
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

On Tue, Sep 16, 2025 at 6:09=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
> There's not really any point in listing every arch in the subject.

Ok, I will fix this.


--=20
Askar Safin
