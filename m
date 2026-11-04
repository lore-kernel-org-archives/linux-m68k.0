Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832371;
	b=FDQp+RzhOsS2VDD+gZHFNAATM6VqzmmUpdm58ZES0PMb+997zL1ZOkCe1O5Nt7twCIXg
	 SHoWGwurO+Nhklusa509ieUS7yFnnxwfmj13mW9D9UJy08rygRghHGJAvqHIDQR07SrXy
	 AK/1HM7okVOwI7MAUXw3L+XUj4C/l4oVTWeJRXgViGtt/o3U6XKXUUsevgc3EZhjrf+q6
	 VbFGqe1cpW9njlqAjtzuJ/L/E5bZN56Y7DEfJrZl+q0n4QAVw6Uw7CE4GAvNHfcpW0Kf7
	 2gWScU73UGecNYNXYwzGII0X5UdPWLzGIMCSSycV+NznP0rrJg0VOrOsSOEkbLLOGCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832371;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XBOw8umZc0PSygGL6ZhSsNEhyMPfzoczgqWFX+5YDNY=;
	b=HB3W1Qa+vCr6+PBqCnFLkk494ASESrKmOXyblTNS0pJ7xI9Bo+1pjgelcZyz8uO9ROCi
	 2L5tS//nZhuyrwfcW0C6g+cpP7PT3MmLP9SOhEig81PHqfh5BkMgl15ZLe6dq9rGnsZ7a
	 NDzfFoagB2Ecz9459yPbPob6q1xfuDC4UE9AyjtYP0R7syLIYQm/LooJnhXQAs1z9l6X+
	 PKeTQOi1t0Fi0K278ry1bXYJtDBD2VE8AjWIU42telcOW68wljuYKWTU4NRKGCaUPdjX5
	 PZADw97iv471rTZmcTv36BvwZ/rBBU7XIN0YHzlKC4Proh5YOSpg1N0oN8k+XGxxQTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+guEyix;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77697606A337
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 22:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77697606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+guEyix
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E931605D5;
	Wed,  4 Nov 2026 22:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C1B1F000C1;
	Wed,  4 Nov 2026 22:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793832369;
	bh=XBOw8umZc0PSygGL6ZhSsNEhyMPfzoczgqWFX+5YDNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y+guEyixDVYqpS8g3d4FmlRYq/qp1tQeGL16K2BSxNthPOaRsDL0VFTK+tjHByNf5
	 UG3G3TR4IbDk5BaZwlgwVySr0HiRvL1WeYdDEujyS+zzG35LMJqu1Pm8BzfQ5Z+w4F
	 3DGZwBGiTOYlKSVRIgaBstWj6LtjUlnMrGUfTY6AgB7LPx3pVl/0nxTfWzl1eRWVeu
	 9SzZPPQ7yLUIbBzvzOD5olkzaVc7Od6fJQ93jvoDvEvbyLIezG28vK5PJuGqQJ/Zu+
	 C/TFnkMniWMHftytXgdebgJiyvQu099dnGFvQXlwnwRKY6VGKt0bkFzVDUexAPr+Sm
	 GvRbuyQmKti0Q==
Date: Wed, 4 Nov 2026 23:45:55 +0100
From: Christian Brauner <brauner@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, 
	Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados <joel.granados@kernel.org>, 
	Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, Jan Kara <jack@suse.com>, 
	linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	netdev@vger.kernel.org, ntfs3@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
	coreteam@netfilter.org, kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	ibm-acpi-devel@lists.sourceforge.net, jfs-discussion@lists.sourceforge.net, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, 
	sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, 
	Chuck Lever <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
Message-ID: <20261104-allein-bepacken-hitzig-5e517d3c129f@brauner>
References: <20261104-work-procfs-v2-0-b45cd5789ac5@brauner>
 <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>

On Wed, Nov 04, 2026 at 12:05:08PM -0800, Linus Torvalds wrote:
> On Wed, 4 Nov 2026 at 11:49, Christian Brauner <brauner@kernel.org> wrote:
> >
> > Part 5/7 of "proc: move procfs to what kernfs does", on top of part 2
> 
> Christian - way too many patches, re-sent much too often, cc'd to way
> too many people.
> 
> Nobody is going to read these repeated resends, and all you are doing
> is clogging up peoples mailboxes.

I resent once after I cleaned things up post RFC and I don't plan on
resending (one failed attempt due to my network dropping).
