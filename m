Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260763;
	b=ufk/8lwTKJoH1TkWnyZMiUbdu0XzMQGYsbuKArD46+LqAChVKzhTh7z5IjDlY3+aFEbo
	 aDkWR9kSjWbbc8mghUJrozFcXVHBTqPG+gkvMNNnpWR9u9Ddx+x9TX+8JR/INzo2Sv5HD
	 D8HloeCznUyzsS6N+r1jggIsZlaTEPnLyn3g0I5bgqONz2ICLxIq9jFD94JYIaToxZWaa
	 J79uOOOwCqNwmqHH/OKOI7Rylt8NpZuC4S+CkBCwdtGAEwM7fiZ2hlBKpoDHM0EW9jFdH
	 2BQjvnSrAGXYuUhB2l/cnRV6Sr8gIjAXzH7NANJwprr71bbFz5/X7EjvgEgdZHdVPxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=874yjmK9ypxK94+nKOJ/uR1d6HpqK0owgIThZQA8ZUA=;
	b=5HU+GkODqT12O5C0r68UFFA6kHkpCvje+Z2T5weSxZ3NbxS+Bcxau0G1/1dkxSWq9Mzz
	 0h6l+FSTeNec3F6TjGKLxqKGbjom47cSzw4Ip0ag46ZnqTYk3DtskUyOIRFPfM+Pgm+C3
	 vc85ugD8D4qP+kdCeq4tPm2n1cmNDsUcjOfuBJUC51cPfEkEpkQkHTbKLsO6GkzxMAr+M
	 KVqLn2UR1uQ1CcahLj3dzar2vfSFSWeicWrQydhNwlcfGmHK80G/mkAoGdAe1XswgynMD
	 I65xxdPQuu9YQhlZzB+S8jbmXIfTkNkK7eH25FB2QQB/twIMGkuzgz/1pUmjmm8ti0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W4R/cQHQ";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B06606A337
	for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Nov 2026 21:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B06606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4R/cQHQ
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e47347279so893317f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Nov 2026 13:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794260761; x=1794865561; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=874yjmK9ypxK94+nKOJ/uR1d6HpqK0owgIThZQA8ZUA=;
        b=W4R/cQHQZo9EcdbWU0J6X9quOjuyN0iWZ9LS7aBONeDVC6Xoo9nZIbkMr7D3uAJW+X
         H5MB6vb9yOXk24Z0C/1OW0qYWP9UZJ5wZUZTUeomRWKt2AkvCTh2X9GU1mlUHoFGDamo
         HeD9eKIeUSiNQAOGYr1F8TO95Pl1nD/ZYqbUK9pB2xmJ6cT8KEOmHd3CV35BkOL31lOC
         OHhiff6wEUbt+YPHtIbeJPXQIqeizE3bo+Rnv4e+B7+4+mCBIGSVbeqn4Cg6cnD3cjIJ
         Yp4hHpWqePJ3n9r4GSAcRiVrQyAdWlkHY0YXzGSqfqXsk4bYNNy/sIA0NPFFpoqDHvHM
         xu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260761; x=1794865561;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=874yjmK9ypxK94+nKOJ/uR1d6HpqK0owgIThZQA8ZUA=;
        b=HTL9M32xMWjOlcDYrXKj21H6suR6M599QiruMpRx5Osop1+ReXWgCHYwDQGvmXzgxu
         7AvX6t/5PGYbPmKwqCoK3PSI5kz1s1V80pT0RbV5uqSXJoIKXivmH6ciYNaDVCVq80oh
         n//7PvA/I6U7g6yYgE6IyaTR2lHQ4f6icCJbQHtGtKwoM7kMar8MLOnb47gFM/a4Jg4s
         xZy1Ywn4tF0sBaswGf4ODsD6hbbXFFsyof3ohbvtcwOyYGvE2H1jGdWXsoS1LzqdcWAK
         JcvQbkTIv20Df7JA1fd4oIm2/PLvsx76dFvmcujPMu1C8lRAKic8fP30/q2bZTjS1O2t
         pu2w==
X-Forwarded-Encrypted: i=1; AL+hErG3mtavpQ0l7wNmFfsw+ypA/JsrNWrENGJ8tuOMrIbVR8LCxW4KtZ3NKeyosh52kDx+pNvBW0z7Cbjk@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z81/9PsAMT88nMvEIl/vZfhOcOETVO/DC1s34spH/O42yi1VbVr
	To62JYOtZbJH0I2Xe4YAbuAVuL/APWyjHnPxpPah0WBADLoQMYz/ssWu
X-Gm-Gg: AYBFou3IXDrrsENpDws6SpN2HMUaB5xK/a4v6ipleyh8WrAMHLwxR+FRmZp5TnB/d5f
	+GS04+kcoZ2/7OoJY3hB28Ff82f9lDo1VQrYWUk44gClG4+gXMMm8IuzyEXyxAxDXk9wS3+wv92
	GdYzNxkbhqz8bz4ZSA3G635yiAtwoKTdEp2qgvzd1Q9CZjgFEZcPl5w3wknrVF5FtEHdHoxf2hm
	ZM2nQZnzQaLmYmsYxelgJJ6kC4NemNrwrF3DGcfOd4R0gUOqEeLXrtZB1KUGzyr+qWReHfVX7OW
	9eIVeq8osM3mOju01LY1NF1P5xmHSmvXy8NM4YaMSwa+o88nKzdRc6DPYABe/ev5Q7Sunxt8Q7M
	hFQK7MPlUhCauv7IQAcQ/7haS9TAGIbArVy6DEDHAUmtlmgfI6RhBZN778Sbv4oNasyDa5TN+wW
	WHdyEcZZzxBhvAuLUwCQdqjNfCZSzEF5Qm3qEs3rzF2ViW5ayLcQV0Fz4lyYkmvd+J2qkXpUDgf
	hl1y33BPIGJ5VgCilURrkA4hBLfXEmREu0YXFYBAsClrAvLBJp2kk6acSm0GzqFalG9Q7rOTtUO
	0XBmYkkCkydZKWXj/qcCcrIqqaMluBlRwwtoYGDOHvTe70kdt4LsXjKc1PNc4Q4jVw==
X-Received: by 2002:a05:6000:288d:b0:48e:25e1:5eb8 with SMTP id ffacd0b85a97d-4982b28aa42mr1487213f8f.3.1794260760763;
        Mon, 09 Nov 2026 13:46:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm1213644f8f.10.2026.11.09.13.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:46:00 -0800 (PST)
Date: Mon, 9 Nov 2026 21:45:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Christian Brauner <brauner@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, Josef Bacik
 <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet
 <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph
 Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados
 <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara
 <jack@suse.cz>, Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-um@lists.infradead.org,
 linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, ntfs3@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, coreteam@netfilter.org,
 kexec@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mm@kvack.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, sparclinux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, Chuck Lever
 <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
Message-ID: <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
	<20261108185953.28054fb3@pumpkin>
	<alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Transfer-Encoding: 7bit

On Mon, 9 Nov 2026 05:05:57 +0000 (GMT)
"Maciej W. Rozycki" <macro@orcam.me.uk> wrote:

> On Sun, 8 Nov 2026, David Laight wrote:
> 
> > > > While at it, I think it would be good to use this conversion as an
> > > > opportunity to replace "char *" by "void *", which will probably let
> > > > you drop several casts from users.    
> > > 
> > > So I tried that too. The thing is it drops exactly one u8 * cast in
> > > ntfs3's label write.   
> > 
> > Since char is now unsigned that one isn't even needed...  
> 
>  Please excuse me missing the context, but what circumstances does your 
> claim refer to?

Just that the cast would have to be:
	u8 *foo = (u8 *)bar;
where 'bar' is 'char *', and I don't think you need a cast there when
char is unsigned.

David
 
> 
>   Maciej
> 

