Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784335;
	b=vUSvWAYa3ECXafF5i4b143CF6m2Rj+vh6Sx0qMW7PpST6vL1gN5uNcRWbk7MoVEtrNiY
	 i8Y0s6106dXIgA0CE+9FP5tKr3kKkuuWoN3wSgwWrx86fNsSf2lztsmpbIyZ0RyL02L+l
	 V0QSnfCyWS7sZT4MClAz5N3+0O99Zwm+ymmM3gtIJRjWWPAGfD7E5lf7xL9qW5KOA8qie
	 sv0OVMRnVCvyRKl7bxPcQ/lJ6OuDbRs+nHyKc/mnHhLJwEFTqjgespThvTkurbi1KQPvz
	 Bpv/lU52+K9GxSH8ymWP4VIPKqkJH+y/Tgltxl8aDHIKeWvtABuRlWHKSGoGHTNSYKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784335;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6y/QB0A+W+6N3jiXZRGNY1xzzbI4566zJ/BaiNow5YE=;
	b=Oi87VRumop0mZa5Udw4/i7KtmC2jSCPqfSrWT1h2WsNmutw+QKcFO13gumeVjfboeM38
	 WKb6GnsLMbWWKm1m26qgfmfqW1F1vfoXA3vuEt3MDdQhC6hsB5J3J/QN3kHHmcokMlq+g
	 Ps0wUs6ZVGCSvJNypXg/Z81kcZQh/Yy7mVtpqSBXJJWdizzuBLdoTx4YxeKPmP9/86JfU
	 eg2Dxdl8scaZTCXR6bKn74xoMaGRrPIA5+fa7peqX3e33+jjeXTKU7/CfJACscCWGm5dJ
	 SJL2RvfL3Qstp7vPx6TCAgOjqubgREtV1tkjfHBJOEMaZtgMA3aRG62oZbYm4Bk7Z2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blm3Fzks;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ADB606A326
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 09:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24ADB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blm3Fzks
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9243240257;
	Wed,  4 Nov 2026 09:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF441F00A15;
	Wed,  4 Nov 2026 09:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793784334;
	bh=6y/QB0A+W+6N3jiXZRGNY1xzzbI4566zJ/BaiNow5YE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=blm3FzksIwmy/gfP+m6bQ3l19t8u+6D7VnMjx0mDrwJfI9yqkrKHuitgS+09MOaFB
	 5IAfK41yIRysnuekyE6n0MoqHw1erKQfYIHd4bcxX9IzwZZwgAZVYki7z4Cj5AIA7/
	 ZPGTgJBvsmIssHVAjO0+bxwX4CubbRT4ywfOYmYyDPmpCbFuRzICtnH6f+UaysQImg
	 q7wpeNs4gNICgefy3SKpkaeX4BbxjIfO+vSSQmRySEd1imrt/h87R+LlDv4MuyR4ux
	 lqn+1ClVwhwp9e3GHxStc7SnGYtfRsRPS5FsY3RelvLgIwBZIwrO2g2A54DZvsL3tG
	 vhwB9M0WME18g==
Date: Wed, 4 Nov 2026 10:25:21 +0100
From: Christian Brauner <brauner@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, 
	Chris Mason <mason@kernel.org>, Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, 
	Eric Dumazet <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, 
	Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados <joel.granados@kernel.org>, 
	Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, Jan Kara <jack@suse.com>, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
	linux-input@vger.kernel.org, linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-modules@vger.kernel.org, Chuck Lever <cel@kernel.org>, tytso@mit.edu, 
	dmitry.torokhov@gmail.com, Petr Pavlu <petr.pavlu@suse.com>, 
	Anna Schumaker <anna@kernel.org>, yukuai@fygo.io, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [PATCH RFC 11/16] proc: let procfs copy in writes before pinning
 the entry
Message-ID: <20261104-ankurbeln-gepflanzt-elegant-896e9dc995a2@brauner>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
 <20261102-work-procfs-core-v1-11-75df35e4f8b8@kernel.org>
 <sashiko-outbox-195538@kernel.org>
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
In-Reply-To: <sashiko-outbox-195538@kernel.org>

On Tue, Nov 03, 2026 at 03:01:26PM +0000, sashiko-bot@kernel.org wrote:
> - [Low] proc: split __free(kvfree) declaration and initialization in pde_write_buf()

Intentional.
