Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719151;
	b=UKV29/vT0pj3gjvuKWWFWSpjEjUhqLDi/TMkvnyevnCASFx1pZ/lK5dbq4HwcbCgQqy+
	 x4TUWTG2GohiAiYhVas2o3yIz9+neFwrlWX+EJKYTitpZiNeugy/Rri10M6K9nSRtMjVf
	 HUXqJ2EHOQiWq09en4LDKERg2jeko5YRDNc0bYLMFIpaTxfkrwol1mbNBkFNMHAVJUgj0
	 hkWKfSuSAPV++Uf4jQ8/xkG8exW8mqQlnV4Rbqz3gHyhK4qIAwVIQ88wz0IVWNt+AngUA
	 HOZrCIe8t/ePxFhjIzdJ/YNIIvg4OkoaCTq2TSFKSIQPRiFW8QvQgAeRDmO+Mnkd/ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719151;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=GJCj7Kn00SbLJvTNolj473zurqrXw24NOUW+dVEOMrc=;
	b=Q74mF3KfuFg5s1AhF9lsQLJmoP5z9cjW0f67WA1nuWcFxe5nCYYSkDtw/L1kAJviz+LO
	 70tOB59VM3y/P7JKrlD68Lf6KGIeX9pwd1ijLsgI5KcaVpYU6Jk71cqJTvEx5zp+4bzLM
	 aaCFbFQPUEWZU6op6JjZF7RB41MfhkS/mivUrkaO09Neu/uyamAnNErgpO7zBW6IKF6Uj
	 m2whq3q52l8ERMPb44EVdoQO5AzMfdmkWVG6ZdgjR3EtS6snCxWnMcdoPSXuXmxq4jZ6z
	 akTlTdwYISmrrKxMJnEFjS6HeTN85HLITL9pTw5dsJ3dw2BUB3jz0aL/4wOi1MxVx1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nsf1aJRJ;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F44606B26C
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97F44606B26C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nsf1aJRJ
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 086E060A7A;
	Tue,  3 Nov 2026 15:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288131F000C1;
	Tue,  3 Nov 2026 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719149;
	bh=GJCj7Kn00SbLJvTNolj473zurqrXw24NOUW+dVEOMrc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nsf1aJRJ1HwGj8H9IQrji7tMD3hRlznSbt7aZxlejvsSBUbWOOM4A56v1e7ylcWw7
	 yNjaD+1rmjfZxTXp4KbstaI/4dUC0ktxITysc9eOvhOCqvY1qUmFm7Sr9ZezYFcQF2
	 DaQ0Fv2TyzFXduotPcyFPlTCNxRa1UN+xZ9FXIJ9FdpOrONGlLSZJxcYjpvWQgIfFZ
	 SD9dz0XlX5yAdz7Dq7WZFDJnK+rruhN3iD7UoXeEeQXeIuL/GYaP8qPNP0ydJo/1hw
	 RrWedATwKabjI3pZZtfFnataKy5WrhF0JUQ86HiiatEOs4CwfaXAXaPYpFPSdjtEde
	 u8K5nHSnx2tLQ==
Message-ID: <sashiko-outbox-195600@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 20/23] ALSA: info: let procfs own the seq_file of
 text entries
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
In-Reply-To: <20261102-work-procfs-drivers-v1-20-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-20-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:19:07 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the show function and let procfs open and free the seq_file.
> ->proc_open() only sets up the private data and preallocates the buffer
> now and ->proc_release() no longer releases the seq_file. Reading an
> entry then no longer holds up its removal when the card goes away.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D20

