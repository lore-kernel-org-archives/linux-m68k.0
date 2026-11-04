Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784088;
	b=UzXlipGaXTEi7lKNvUlF9rMXCC/ROc6A15uSrI1BPp/wE3p461IA9O1o4K3ZPONqAiYP
	 7dYJh5AMt3yzRq4II0ARsDfSxpWK3sctF8oiKy2/8cT6XB86nH6oiPVneTrwFzKvEoZtw
	 jPYmAjLlmTpREVh2xqjlw1HT+JwdxZoeD3+kN1JF76EjxOiyS0JO2XLNxh0RbfDlIdQtz
	 csTE/mSfOpIFvymgWNJxHtruB3RKFib1FrqFKtQvrIAAa7tRb08Ae2G5/DfdWfNtLHQfk
	 GVIvpkHwz0rhKxEcOqnzeHOWjWEvF4Aeq+M9gbI1Xrj2TFznKl5SC2WosQRGl3ZW27Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784088;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=TLWmGN3SfRKJzJtFGqy9xXljoZdTMIGgQAZ0U5pRqZ0=;
	b=hrhcYFUD2hTuBUtlJDBLOayUkNxSxQg8LH0qxvMu25KU68q1ecf2hE5uzFb+MQKGpaYZ
	 S2MSw/suO7ig1hAyc2MY0eYVGjtym11AhWLvuA1jF4usonfNjmdNnuQtiXxmAJR27WmTa
	 5zI8QNfFlaCEVPRS0bvTVJeTYvuwoSfkcKsIxOpzTEB2MYKKtFEcG/YkELk1+1U0uZzsH
	 xPw890MmHOmkvs03DCapmKS1jqGgt2Rj3jk8jpfzsQv0JIQGEIhjbrlAXn2VoMzSFnE7M
	 oDSMS4NetF/juUilKQXlUF0CLJ1LMU2Rr/A3wVUKoR2eI7np8PzTVtK7X3uoAU9KvNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RlGTCzi8;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E997606A33C
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 09:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E997606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RlGTCzi8
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 43B4360142;
	Wed,  4 Nov 2026 09:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC751F00A1B;
	Wed,  4 Nov 2026 09:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793784087;
	bh=TLWmGN3SfRKJzJtFGqy9xXljoZdTMIGgQAZ0U5pRqZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RlGTCzi8pu88TVAb0kwn4joxUiR7mlBDOdPpezl4XmsvQd8kAh4iDFU4pQONkMHIu
	 eliic42rAIpabkq9bUb6HqnW9ZOmOC+nO6hIz58hrOaEoVJAOD6f1NccFejHSUbQEg
	 UcTtVvMVrKX8rkKsqChfbeyKOblU3iUz404/VcCwAESFTSpzfmuSYLv6tIXqWgvwx4
	 JsaFcHO4jSLDa+WNzQE5ZJzqGGlwKjwInimlKuIR6uaQtqBJZavxLJ41GnGzP1qeFj
	 IB/K6cI148TQ1ND1SEtNwA24wzZ0dXL4wMxQ/4D3P3yQeU5Lj8YAihYUT5N5BdD20o
	 LKB+GT+o55caw==
Date: Wed, 4 Nov 2026 10:21:13 +0100
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
Subject: Re: [PATCH RFC 38/38] selftests/proc: check that a faulting
 readlink() doesn't hold up removal
Message-ID: <20261104-erwecken-pulsieren-anarchie-9a5a7582621e@brauner>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-38-59422ed3e465@kernel.org>
 <sashiko-outbox-195510@kernel.org>
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
In-Reply-To: <sashiko-outbox-195510@kernel.org>

On Tue, Nov 03, 2026 at 02:48:45PM +0000, sashiko-bot@kernel.org wrote:
> - [Medium] selftests/proc: Makefile adds nonexistent proc-remove-slow-reader target

Fixed.
