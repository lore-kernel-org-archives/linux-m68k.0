Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717259;
	b=A6EZ/I4vRJbvF3CU9DbXh2zPQly/KKQIulqEYirPwLwOuYW1Ckxe71MmUf/Tyy+muOvr
	 8TNGpEsXL/gXNmjSUGuBsDkIJoVPmCZgyFF2fU+EKZnqN1NDEX3g4gGlVGjUVRlOl4nsu
	 kNTwhEd8xS0POkunVLdsyD8A33FPx3upAszX1j2+VRX+2iBeWHgCqQN1JVxqzbLEt0BMm
	 wN34SzYAbYLK9LfLPVHA8I1PMWttGVz0cPYu/3CDFLJnd/RXJvUIiQ4W11djKE6nvdYNp
	 FOsGttDnHIe+flz6Rc9MFdxt1BVz0Nkf3ous8zl5I5iz/TTZO1jWR7O8bUzDdYwG7sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717259;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=N05eG3DcsrZpQfqjL5D91LwnvEOvTP0/ov6vkT4Pvcs=;
	b=1JJ+12USnlAo8CV0tYpwg7TJMknbwqYlILAuscvo7EB6FgBT9FTU3cNoS8jiBMwkxMT/
	 PZLf0PsYJFKpAYhDrrV9YZXsnPzyVlsW++af2apMlB5Qgu6lajToPcjOXcA8utbOObW2j
	 6rUKQqMeWHi8GJwb04F0caqOHZh0iWQP8lih6+XZyCzLk+qXVw+bIahaJ03eXxWFiQV3I
	 9trFx9CsGs1aSWUyLOL2iag74y7yuJ3LF4az4Ndj43KKjTpRvZblqgTlrsKCn/HyVtrSF
	 oqJhBQeNiwHpJ14wpAJmkC2Ocmx0aQZ0JVA3ZxCD8ju5UHw+MD1OXWnwJUrGjCmrBtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hasVYka7;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D93F606D828
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D93F606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hasVYka7
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AFC7E4095E;
	Tue,  3 Nov 2026 14:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80461F00A1A;
	Tue,  3 Nov 2026 14:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717257;
	bh=N05eG3DcsrZpQfqjL5D91LwnvEOvTP0/ov6vkT4Pvcs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hasVYka7WfTQX4gVG72LHVrtfNEhVp4P8ZtdcWyH+LgHzqiGmI0IYbQHO1iwq9m07
	 y/1lwfnTHWCCY+cbAgh9hskIZQ97rVMlqM95iGbxPIOe3f8RS9bNGt+mxw9ntpVqb/
	 scjaMJLEVTqoyjO6TjfG7nqX7032JBfqmizKNDbPX8HDDI6FUj87MgRMBXyr8hd/G6
	 o/Ht1P5w/7ACphg2RTZAjkTSNTX/ebWs2gke1l0yWrd0iIR+fNLltdhYI899csOJwZ
	 1y9qK6xl8eu6MrQZdcUR4uzY+8RNuZ/DmBvaIF0iaqRFYBY29TqHfRB0P45MNfIHFj
	 usD+mtvrE3OkA==
Message-ID: <sashiko-outbox-195477@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 05/38] platform/x86: toshiba_acpi: reject malformed
 brightness and fan writes
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-5-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-5-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:47:35 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> When lcd_proc_write() and fan_proc_write() were refactored their checks
> were inverted but the && stayed. They only fail if sscanf() didn't
> parse anything and the value is out of range at the same time, and for
> the brightness value < 0 && value > levels can't be true at all. So an
> out of range brightness or fan setting is passed on to the hardware,
> and so is the uninitialized value if nothing could be parsed.
>=20
> Restore the checks as they were before the refactoring.
>=20
> Fixes: e1a949c1b988 ("toshiba_acpi: Refactor *{get, set} functions return=
 value")
> Fixes: 3e07e5baa2af ("toshiba_acpi: Add set_fan_status function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D5

