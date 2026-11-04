Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784049;
	b=0PNeotfv9kIvQYV2k4Jj5qk5DX+Or3p3s1JUCAmlSiYENGq+84u8w+q/7LpWBUXNgnEd
	 1ow9v9fe3RTJWftfx098J5QHLUREqHv0NTMYfMZf0oOqAQT9xHuEErPRrdGNmRUltfaIc
	 zBu4HT4oiSFpd1uRh9vPk1fCIMUt/qqMa/9x3wTfwTsqeZiYzSRKlm2s1LcyaY7k7yyrB
	 /GmWelUK9fRd78b1KKQ9SEnISGuD0At17+MUggaQEHGEn4Wftlh7Lu0hl8TIVTq9IPIyO
	 B4IwJaZtxRV/sIJhK1xJcA5iYdfXgCx0ds6u0NdZ4s67Bywfp4Y9FrgB8RB+YmUoXwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784049;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=O/cNspokMh0UNXOA6wOkvv54jlnPVAhKOKNo3zScL80=;
	b=GmvLNLWNMWJE2WJQPEs3QzeOv9joCYYEgDDVoflBDjbopxDxY8GpD3KTJmVN7VL6YBQw
	 RQNN/8xKSwQsM6mgOtR04MEfBVBeJawDXeIPDMNIb9xYqnzvEyvVstxZEwIsd9otBUWTZ
	 ULk3B0LPCw0ti9+d12XPOWtDSkUcpDiT4MIbS0KHNMvol+O0EAqD+j8FQ7wWr+wPYvXDJ
	 6WRUKbh3ZFswio+2SRJ3wbFucUgUf/uIBK+zsYHZkTPMgwhKwMoxZdSxdJHz6LHW1fzt2
	 JH1ZQ0Tnb6gmnvmd7nQdx92TtED3vR5vyCcztuIXN+/cA+3PzT3YDuGyFJo7SxzhaVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BcEaKSaA;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005BA606A31B
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 09:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 005BA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BcEaKSaA
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B40B54344C;
	Wed,  4 Nov 2026 09:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884BF1F000C1;
	Wed,  4 Nov 2026 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793784048;
	bh=O/cNspokMh0UNXOA6wOkvv54jlnPVAhKOKNo3zScL80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BcEaKSaAGlv24CwtAidx4vgcs6qvpVaJft+GsrdUwgsUzcXrxh3uKvNOUoNaojM0u
	 zeaAufJdghxwNsRVYbDAL/xLeKpNsJ3Qayq8R/yEjD/hXG6tybWAoeeY/Tcg+J2REY
	 2VHx7FHMLCTTzYzu20RNN6+W/eGKH3XQSxBPLu21a3FQK4L4xV10mVduwGQuGwRq6Y
	 1A0ZHeMOGLNd3RiETXNw1XPlv0+sn3aHbmYt6VyuIs0KUjdL9KaF/E0tjXUuJZvvKv
	 OzKIqB04C/jh70SwJGTPrT4CcqF9fgN0yPVMCzRgZsEpdaIpp/2cLp+CNRnZLAYstK
	 OnLeMUpNmqPkw==
Date: Wed, 4 Nov 2026 10:20:35 +0100
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
Subject: Re: [PATCH RFC 36/38] selftests/proc: check that faulting sysctl
 accesses don't hold up removal
Message-ID: <20261104-aktionen-endlich-ruhmreich-92f35a0ee397@brauner>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-36-59422ed3e465@kernel.org>
 <sashiko-outbox-195508@kernel.org>
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
In-Reply-To: <sashiko-outbox-195508@kernel.org>

On Tue, Nov 03, 2026 at 02:48:40PM +0000, sashiko-bot@kernel.org wrote:
> - [Medium] selftests/proc: getdents test faults in dir_emit_dots() before entry lookup

Fixed.
