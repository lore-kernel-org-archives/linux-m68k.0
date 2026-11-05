Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908151;
	b=N/54gB6iQCVWheLEL54HpbdJ6vDoBqnEccYPBiYDTMg68/63GykvMEDZioLt3hLlBA/v
	 TKGbV9a1ilO6YkG82+KRI0FvzfB0LjnjWH3xB3SJJanv7GsqAGikriikq3syTSKHdZNZ1
	 9tcRh1i3ouMH1L/dhuZ2GAX5H8Zl1OcHbCdN/fHsNhyl2SaE1TTShFYQZwMeyNWw7X0V6
	 rXMettX9BxUd7QAnapkiech4g53QqeFxpJx9mkfzCcwZpUfXOPpEXiVid6JVlPAEwhrD1
	 EXffKMlnecJfIjzczd/O6D/LqGpw/CkEIlr+RJNielkJDuV69OJaqCvDHVIvFed5gXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908151;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=j576KRHcZP9yIpKTo/UJghDk0+rXi8RvjS6Qhj4O5uA=;
	b=p+39i6Cz1q1IdSjWnq87gFzbZB0MUGD7TCUZDoZyCyfGLM+3XRZGRzrAW7FFRf2jjQTO
	 fCBtumDyIILexSMcnojl8erWl7qDWZOMNtoNf6k0HwCp+7HMIdudmmR1UtdK/D8KIQ9tt
	 qGk9fipkaeQg7wADi01wrJZAf9GOpu9Bxrx57MACECsKgY43N0XW/b/9zffco5acOvEPU
	 6p7D4INHflUSUTFkY7+ho21SBLMySbigHHlyGPVaG5B/ungpdhXRaa3HlVbrYableegtd
	 pAB6X8Wtq0AJVmBPOmY7EV5zf+CkxEgsLDwQ3jegRHa8GgtFV2WpW7YNbS24RX+96XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MW+F2Ga8;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B5E606E418
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53B5E606E418
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MW+F2Ga8
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C63F600B4;
	Thu,  5 Nov 2026 19:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2571F0089F;
	Thu,  5 Nov 2026 19:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908150;
	bh=j576KRHcZP9yIpKTo/UJghDk0+rXi8RvjS6Qhj4O5uA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MW+F2Ga81KEAj1TlwAXZ72uDvQycuqtR1M88dTEq7ZM8hTowZMbGHRtOLi73+/5V9
	 HKeBdRHxyE39PQVrF7RgQb4XLKCf7nj1LbHH8y826+nvLGF46X8C9sqIk9B0xXEDZ+
	 KPshaYv5tvVnNDId73WCrSUIzluua/PnssViJXznvL7a0q5uUw1yO43+IR0MD0EjHo
	 GG+GTrDDIuCbZjKWBUtdpmGvFrKbhDioUGi0S8ughk/HKFMqWK19qP7/7yr47zF8B/
	 wnFgrxAsWqOviOiZSWMXDxwvRpOths20CszfABGqDZs1JYmn230CEaxTxFFude2YOt
	 SAT6pwqtZXtzg==
Message-ID: <sashiko-outbox-199988@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 02/26] zorro: let procfs copy out reads
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
In-Reply-To: <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:06 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_read_buf() so procfs copies what is read from
> /proc/bus/zorro/<slot> to userspace after it unpinned the entry.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D2

