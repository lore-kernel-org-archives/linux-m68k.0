Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717269;
	b=FvTgQ9nurB2aqP3nSortgPkyH0r2DO3rJfv4OmY92hy0rZOZ0024agtgzfQ6Up1wWt32
	 7m2kinVRF3ECA2b09ParImhp55yZbS7nB/j5FhOnvdnze5XAyfsJEo/gvlGkY8gDYEPa9
	 fuzch8BG9wLEdYLkQ1iJ3VSaegn7Zib7qy+ISYB3CnfJMzOITrnS2sWYOuR1z8Vf1g6p0
	 netRetPy5Mq8ZDS0naBuqNA2Y/bIK/x16nK/PumV8BI0LOIauEGoK3pEwDnZjEkgmu+dL
	 32vq6m4w7VoXxV4DCallRm5EbcEh2Dc2E66RztonAqvkjubed7SzYxxMi3MNEtwVDXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717269;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=mViIUxRNZIoofVsWiwX04B3K3onsdHxagHM514Ox1M4=;
	b=PZ7qrq9l+v9VpeXjsA4MO7sDBGKM0htUGpQ8FYTpNJ0hQSyf3q1Bemfe2DL94nPHxGbm
	 aqYzN2a98q8pktG5GkKb19toPyIbnbK3Ct1wLiTCqmbKzPQcFwD3jyxODdWgjfIFXvgk6
	 kw37tkFo9P288jI9yvhP6ZKNm0GHEM5Voqk2Edy9bQvQPn54okA+8xrLW46BVlpClukRp
	 yeeO0OqCfH0EREpE1w5D6zZg+4rMmrBdtRyodlFhq/qA7MxBLzTt2F9ijCPXHEJnFzXD6
	 FI7NRj8b7hzl0LDdRwkriezhTo+g4c7Y+mE8ZVuCI3OlX6Gzx+YW12iCGVw/q5Ef3tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aH/asmyl";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9A26082BEA
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE9A26082BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aH/asmyl
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BB89B6022C;
	Tue,  3 Nov 2026 14:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B9D1F00A17;
	Tue,  3 Nov 2026 14:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717267;
	bh=mViIUxRNZIoofVsWiwX04B3K3onsdHxagHM514Ox1M4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aH/asmyl4nElVluuN+CpEBKWL3OzlD7RbEaxQGMjr94O7xpbH0XAOYTf1yBhHVd/y
	 TgzcLuuupFalbdLvEEXiNgvpSD41XGTFXKXNcYP2BrSbkhzb9hEiH3Nf9LHd0REr1e
	 ZaAfxsc2vyYOCAweCvelhTC327/7GiZQOmyqc2Gljz76b7ymN6jmC9M9IX3lY9tDAu
	 09YoWfStodXkELJrxc+0/qGSQw3/TRpty2+6LYLDX0gzlX//yTUlfR3Hn9lT4tiZdV
	 umBmn0PCmKQPhxVkxVA6cM5PmQqNO5Y0r6pJhij+FJy6FF0m9P8Zzz1np7yXbTty2R
	 uEIGiEOoNRZjw==
Message-ID: <sashiko-outbox-195482@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 10/38] scsi: BusLogic: don't return 0 from writes to
 the proc file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Brauner" <brauner@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, "Jann Horn" <jannh@google.com>, "Josef
 Bacik" <josef@toxicpanda.com>, "Chris Mason" <mason@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, NeilBrown <neil@brown.name>, "Eric Dumazet" <edumazet@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Al Viro" <viro@zeniv.linux.org.uk>, "Jonathan
 Corbet" <corbet@lwn.net>, "Christoph Hellwig" <hch@lst.de>, "Greg
 Kroah-Hartman" <gregkh@suse.de>, "Joel Granados" <joel.granados@kernel.org>, "Kees
 Cook" <kees@kernel.org>, "Jan Kara" <jack@suse.cz>, "Jan Kara" <jack@suse.com>, linux-s390@vger.kernel.org, coreteam@netfilter.org, kexec@lists.infradead.org, linux-pci@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org, "Takashi
 Iwai" <tiwai@suse.de>, linux-ext4@vger.kernel.org, "Chuck Lever" <cel@kernel.org>, tytso@mit.edu, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-10-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-10-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:47:45 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> A write to /proc/scsi/BusLogic/<n> resets the statistics and returns 0.
> Writers that use stdio, echo for example, take that as no progress and
> retry forever. Return the number of bytes that were written.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D10

