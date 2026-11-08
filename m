Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164398;
	b=H6LoMHqxBnX2VkWfWIh5F5dwqZzu2stBD7EceQHsrdExbI4ct493g0otqTvcXD61LjBt
	 39iz9GXukvYFyzoHKzsk9lIRhcjIV3SGNUVlnQeUK34PbEtwoALOYJMOf9vu1kE0sYC9K
	 jraMBEeva6bmuAPk57R5DGR3CMiX80q9rpb8yGcjznG/s/sBMujr05cdNwnu0M+UvMO8Z
	 AW2XqeIinnssWmSzc9sjAo+z3pjGoXbN54DqQ1yNSoZIpFrYZff02T0DsmkdspKSCVgN2
	 GaFUJHszYe6icPjqIljp3dIcG+6NIPRkzg7oEy1nevkCYsccPdRKdlGk0H19ZyQLRGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
	b=08I/7sSvKQBAcJXtCC4jC8LgjF4foFENmDO/vYxn/J1h1AlfTY/y339P16CoszXIXu2y
	 V/g2uxE/98PQRL3OQJOms+0VIM15gHddUHm8BVVXTA2/wE++7nfLSMYdxun3PXKlhjD+x
	 DG4xSDwuLXhQiVqy/uzWxewNiqs39uinjHZ2r1VkInviossqVkLvupIhdnntIHliF5s/Q
	 SRYomcjyQ9NhXB0kT58lSqtevpnqYLML50DvRjoBOqUucySH7j4QYqID076s89hA8xKCX
	 HLhjzOakrkfDPGKNTeduBQGcqVCv9Ro44o69e3OUIcbt5Ctur1rz+7L0hQAq9yr2xWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xWrq2ABm;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3862C606A337
	for <linux-m68k@lists.linux-m68k.org>; Sun,  8 Nov 2026 18:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3862C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xWrq2ABm
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso1791505e9.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 08 Nov 2026 10:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164397; x=1794769197; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=xWrq2ABmzvVm7tlJTFMs1GvSIXyd8GUXz+1sODz7JbZMM1EXDM6Lmp8d1fWoWqu3hK
         ZXqSfGnru2Vu+85nOgSUzQk2jpVVIjJfNH+GiP6ZYUDBXorZTFOGVll61OY8WME9Wpld
         +eL9vxpbr19jev7J/sWSkzFLsyLSBYJM0TbDuDM/fkcv+25VhhZBqQhacmwYUNkIV625
         7VO+sDa1RjHaAQI2F6fXxivIkpQcFE8gtyGHvrp7WyLA4bSxaofAMHQov4KBX6v2gsS3
         dF/Gjy1e81Zo3FPYCp+pG3K5q+5R1FAl5amOa3YhOTSC21a7RfXr3tQO1CWi3B6H66dT
         XQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164397; x=1794769197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=vMKtzmBBI5Qb6diG7ykkyHY3r79dD8tvQ9egqYD/AvVfn6PWvMkJD0aATh3Wi7rj6i
         /LofpyMEKZMD34TiYyG/HXAAlRrYwU3kXzo+fCpdU3KG6NCJaU/9eD7WXzF0ulrwHvA7
         vgZQb8q4AVukS4tiobSmmhhSMxgV+Ewe99H0NyBB3lfbq4uDyh9TCin0AgyX07MwbaIv
         8VwYUXqD6UW74/RVAEZJPXUxlTXSE4AawYhJmr5Oqs/mZ1nZ8x4icFTRRuFs1sopHeP1
         q4mBnzbmpE0M/bJ0FUnPxl0ZGIY4L3Z4WA3RLUO8O+Mr1kMYlM3u5QKldmQfBn6pk+AT
         7UVA==
X-Forwarded-Encrypted: i=1; AL+hErGCpVysaebtjOvWOgOyuh7X7jUDwsV4NfkRz7vi7kjpoNsjPRDhSiksLcVvsTqp4WKSyPYs33crhH8q@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z+ujE4W57sR5t2vg0hSYZ9OljffPwwGmL9zgR8Zvrhcg+Qq6ueB
	Z+z+0mu3TOk4SxMAW9yvD8hc2AUI3P7HmNUI4W0A7So6fHsCYryVCw4J
X-Gm-Gg: AYBFou0tt9kU9xfjGhDPnRkHS2LEVdXkaoPJiKIH6Z859jUX0MPGNGg4/b/MLStVmNx
	pfkXglz4qYwtH9SUbjKaU7dvv35RDe60M66xrOHn9cPQtrE8gsetT11gf8S3lRgdOTtvOgOMS57
	GyCWT/6swPqQvfs/pwUqe3tcnC+6amEYj5bPgX2MWbEKFYSLYJJueSnzNpFjRqc5hqPBbsm9ueU
	KI/KSPe8h0XACh9szvK6YkiBx81n0y4Lx65zd6pjVb1yf7QzNX3onFyNmReh0x36fzzbm37Sx/h
	CeihPdq8LjYocOQgrdeSK8gZ9k1zCUEeZzDdQFCfCYQ54g8OcrvxwCkGJtQ07M2pUQqDMWAzqn7
	on+0ZPviZfYqp42EM0KIsSBfPILFiSnqRv0MeJRqKU//2qFGtUlFAagxz3KXaSRBRCFOhoQUbru
	ntzxifFzpURn+XXXH1UHpPbGKQhPbOOuh2lj8zUQaVHiSK5cqO0SKxr+TbZtuHbOkDXifb1Mddx
	cER/kuxRCJbdXJW0u9aLbbGz+yiSivFemC8RVu3+TGr3JvwWp/qT+UibdaH3CDDDhVvVO+ZfANE
	cjQwCrYc6GBbzWpwZT/41+qvarSAxiTiqwu9MoAvu70Mpy3wPT1aEf8+oK/LUX6d
X-Received: by 2002:a05:600c:468f:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4b960d9b170mr35982125e9.5.1794164396406;
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1f3acsm185228445e9.14.2026.11.08.10.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Date: Sun, 8 Nov 2026 18:59:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds
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
Message-ID: <20261108185953.28054fb3@pumpkin>
In-Reply-To: <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
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

On Sat, 7 Nov 2026 10:48:35 +0100
Christian Brauner <brauner@kernel.org> wrote:

> > While at it, I think it would be good to use this conversion as an
> > opportunity to replace "char *" by "void *", which will probably let
> > you drop several casts from users.  
> 
> So I tried that too. The thing is it drops exactly one u8 * cast in
> ntfs3's label write. 

Since char is now unsigned that one isn't even needed...

David
