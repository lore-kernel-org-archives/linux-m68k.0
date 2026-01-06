Received: from melduny.fyrkat.no (melduny.fyrkat.no [217.144.76.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12B433F8B4
	for <linux-m68k@vger.kernel.org>; Tue,  6 Jan 2026 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.144.76.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706946; cv=none; b=lbW2yQot6odg8rfSEk2E2XPQ2kR9BrrubCV0cettcd3I3L2dBmZP0OpUXHVbK1pnXhiVz3LGx6UYtpYB1hWy+4h79hZ9Ii3eU8VEkbbnLySuuWYiC9HDSTgntVpET99CVhgzQpToQ51CWeijlWZHnabn1lDuSL2n7mnoofw3ac4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706946; c=relaxed/simple;
	bh=u3MLkvHGKlpY2Cflggr8H/M0dXf/e0o9XfmB1eEihEI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kv4Id9vYc5KZ9CrQSeiqphOFSE5rkc+9S+2QqMSYnYeSdxcbUCHGMqtVA/GL4JDcUmKLBPJyNsIwAR3QiYJiNUhxRqVknNSEMLH/xl2ab7s+ilwumVEBqcYEe1qRvDrN4gllgKWDvaY/dM2KlEG0AiRkuR/0o4cG/C5aTgZf5XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kolla.no; spf=pass smtp.mailfrom=kolla.no; arc=none smtp.client-ip=217.144.76.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kolla.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kolla.no
Received: by melduny.fyrkat.no (Postfix) with ESMTPSA id 3A7E44611F;
	Tue, 06 Jan 2026 13:34:15 +0000 (UTC)
Date: Tue, 6 Jan 2026 14:34:02 +0100 (CET)
From: =?utf-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    "port-m68k@netbsd.org" <port-m68k@netbsd.org>, 
    "debian-68k@lists.debian.org" <debian-68k@lists.debian.org>, 
    "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>
Subject: Re: Preliminary results - was: Re: Question on BIGGEST_ALIGNMENT in
 GCC on NetBSD/m68k
In-Reply-To: <9f1613138de30db0248649e6a36c2b063693057f.camel@physik.fu-berlin.de>
Message-ID: <f1f4afab-51a4-10b5-106c-e9e6e5528e6f@kolla.no>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>  <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>  <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>  <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
  <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>  <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>  <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org>  <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com> 
 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>  <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>  <c4f086207e68843ea154b5d41950957fa11c6837.camel@physik.fu-berlin.de>
  <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com>  <2c10a9539a82b534e4a815361bb24c04d30b7e67.camel@physik.fu-berlin.de>  <CAMuHMdXnebgBVWp-uxrmxTFKZkQVU2h-OW7H+7hJ+4beN9DFLg@mail.gmail.com>
 <9f1613138de30db0248649e6a36c2b063693057f.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

On Mon, 16 Jun 2025, John Paul Adrian Glaubitz wrote:

> To summarize:
> 
> - the ELF header provides provides the e_ident and e_flags fields which could be
>   used for identifying a Linux/m68k system using the 4 bytes alignment ABI
> - MIPS uses e_flags for differentiating its ABIs
> - PA-RISC sets e_ident to 0x03 (Linux) while every other arch uses 0x00 (SysV ABI)
> - qemu-user needs to be patched to deal with the changed alignment (include/user/abitypes.h)
> - the kernel needs to be patched to deal with the changed alignment (arch/m68k/kernel/signal.c)


Does this patch exist somewhere? I ask because I am migrating to
32bit-aligned userland (https://www.gentoo.org/downloads/#m68k) and the
gcc provided fails building kernel, stopping at arch/m68k/kernel/signal.c


-- kolla
