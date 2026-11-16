Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812947;
	b=UWGAWLkBX357WiL5m4uUm2jL2KAqGWZGEr1HIzaTEA98GEc0kkZ0aPh1ns1efeWktSQi
	 sxEZc8qKArlq2Q1tEGM5oIXdVVouiZdg7O08FM6pF3cCsMz/oT15mxMFWQ59KeWK0H1PD
	 yI9gBGM+f/XI+DmlM+N7jRKj6evnAX0/iV8uU1RpPWkBzPa0NVpFvbiVCCf4MaL21z+QA
	 t1Dcpy2D20lwRB9D6tU3l4RBxWGO+nuxVScjdkM3ATzGx+i7q4J83uGJ7dJni4XANZ+/S
	 PtjAEzkKNpJyV+fTlGrzRz+YN0kXQp0RdGFwWty/yPXtZymaFpk+DbzT8FCPDuKm7kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812947;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=1mHmG9IJHtIMld4ZeRanDjKIMZUQxx8f0ptnWkrCv+U=;
	b=SpEHCUyRczJsGtgR0Plh1oR7U0d6vh+JRhqyzUYeiUYVSbW8/TYUD2mYeTMwTAIsPIdj
	 tekCP1JzkZZncB+K7vfnKjqn6b0oQn0+86ia49iIro0rK+ceR2zOA8bWDFuYKK8Ie00dB
	 wTIc4L+2j5ZweLLy6TkgTfx4fUygDqdI6nC/JLHNVrJwkVJyeolDnXNQskvDitgiQSnSV
	 fOfOg4nYHIGoMdmMn943BQZexICGE/1DzhQra1vCaoQuPuz4jkZZU7B3L0OaA+HH4hrOZ
	 TlXQCzxirXtMbKsGAT8y1q9xJP6xyNj8ziU84d2BrZ+mQ0Vtg8uAfApLKVBU78Vd32g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36488606A31C
	for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Nov 2026 07:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36488606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 39D8A92009C; Mon, 16 Nov 2026 08:09:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 376CC92009B;
	Mon, 16 Nov 2026 07:09:04 +0000 (GMT)
Date: Mon, 16 Nov 2026 07:09:04 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: David Laight <david.laight.linux@gmail.com>, 
    Christian Brauner <brauner@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, 
    Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, 
    Chris Mason <mason@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
    NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
    Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
    Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, 
    Greg Kroah-Hartman <gregkh@suse.de>, 
    Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, 
    Jan Kara <jack@suse.cz>, Jan Kara <jack@suse.com>, 
    linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
    linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
    linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, 
    ntfs3@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
    coreteam@netfilter.org, kexec@lists.infradead.org, 
    linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
    netfilter-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
    ibm-acpi-devel@lists.sourceforge.net, jfs-discussion@lists.sourceforge.net, 
    linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-cifs@vger.kernel.org, linux-fbdev@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, linux-mm@kvack.org, linux-sh@vger.kernel.org, 
    linux-usb@vger.kernel.org, samba-technical@lists.samba.org, 
    sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
    linux-doc@vger.kernel.org, linux-serial@vger.kernel.org, 
    linux-atm-general@lists.sourceforge.net, Takashi Iwai <tiwai@suse.de>, 
    linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
    linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
    linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
In-Reply-To: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2611160657470.17804@angie.orcam.me.uk>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org> <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com> <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner> <20261108185953.28054fb3@pumpkin>
 <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk> <20261109214558.0d9d5228@pumpkin> <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Nov 2026, Linus Torvalds wrote:

> > Just that the cast would have to be:
> >         u8 *foo = (u8 *)bar;
> > where 'bar' is 'char *', and I don't think you need a cast there when
> > char is unsigned.
> 
> .. and just to clarify: 'char' is always unsigned in the kernel on all
> architectures since commit 3bc753c06dd0 ("kbuild: treat char as always
> unsigned") back four years ago...

 Thanks, yes, that's the piece of the context I was missing.  I've since
actually come across this commit while investigating which Linux ports 
have plain `char' signed in the psABI (MIPS for sure).

  Maciej
