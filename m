Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784533;
	b=Ikf+8zGbbmmQ5WNLh03I6J6Ht5U4lXs6rJni4sJQU0ldwpv40FJ93HnKzOsqJ58Va+sO
	 AjUHJea/N5g0fQiSyc3sh8V3fEM4gvftCmGCi1yO4z/uEFJ/QC+1mpzOcyly1hob/D2NC
	 85UFspjdj9VT8iMtuHIk8EkUuCQdGDLqA+H+oQsgRO+zAyWL9J5sFqkOlSLb5spshtJIU
	 VHZpkNoHZKnAqNQ93tN8BrFqQHnExanuSgYm/h9YlQ+TeEMUkBnIMg5hq2WlC9oTz/Prh
	 xLTwW9uDhwByuQ5Az2FTMUR1oSG3AOKncLF32xAd8zM6OA6Cvd+r0OuvUa1iVCzmf3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784533;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=T01zQUJSjbZp4aJnpwJVQI9JvpnXX6u13mZcG0ZeyDQ=;
	b=jr2G8fFjdj+naQuHBZV6e2TrO8Kx7lA+0DSo/Fz+NkNUo+7krFsqQjbFVTKti9Zlb8TD
	 C4+b4R2jJj0M2sKJyplrkXHKWv2Ac9L7T+ygfBj62nkGJRC7RTIFOOQnNODHqjXZwLIp7
	 SfPmkHw2InriTLEqBO37ygsIyv+NXOSgZUEHYWaRwf/X5/XpadabfYFnbvYHbmrNIk2pJ
	 AgKCidzHN2LqJflLbuwARexqJRwd+I6D5vXe43TRJvEoTK+HECyiQ6pez2jRTuBzbuenY
	 n0TDD5zOFq2ZcHEbIMKxABbRa3nHjvwIBAZwp+OqC6SIWBfSMXApNlysk7tBV34lmeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=alKTGqUn;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E540606A336
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 09:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E540606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=alKTGqUn
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 596F8605F0;
	Wed,  4 Nov 2026 09:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB561F000C1;
	Wed,  4 Nov 2026 09:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793784532;
	bh=T01zQUJSjbZp4aJnpwJVQI9JvpnXX6u13mZcG0ZeyDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=alKTGqUnuzoexCqwA81KPAyGy0rneY6r5MbFqbvV697+Ik/bjfxk9LHef9GM+MQJQ
	 QlHwwMzWgTBR+V1EVZkBqvL2y+0fpSnZdIRpFx1eImmWwcDpXf+kwZoN+KfbPRIwjh
	 GLUEX2tS20NdiCJARKDNfWQpLYmSC9HacZQpjtFGF6DQjakJaImqqw+1NVIZp8Jkve
	 rhjW0cKAwa0rgro+T+KAxTAshgpXhyosdPn/BLM1fw2d0BZ8BRed4fxkWyQdPz2E0I
	 sRYd32Lzz24ZCjwV4++8ADyzClHdrBNXy/ODBoctV+0gtJXx39Cw7SDphwQ7RfGct5
	 fVZStrNkhDPHg==
Date: Wed, 4 Nov 2026 10:28:38 +0100
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
Subject: Re: [PATCH RFC 11/23] selftests/proc: check that a faulting writer
 doesn't hold up removal
Message-ID: <20261104-miterleben-erdaushub-insel-df331d74044d@brauner>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-11-a994bd4d3b1a@kernel.org>
 <sashiko-outbox-195591@kernel.org>
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
In-Reply-To: <sashiko-outbox-195591@kernel.org>

On Tue, Nov 03, 2026 at 03:18:48PM +0000, sashiko-bot@kernel.org wrote:
> - [Medium] selftests/proc: fail and leak scsi_debug host without CONFIG_SCSI_PROC_FS

Fixed.
