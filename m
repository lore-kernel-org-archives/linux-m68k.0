Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908180;
	b=K6I1LIKR4alPxYY7JoOffVsIeWkBD4mYUEbvdn1DKq7pI02Qq0B/Kus7bXCAPFJcUDFo
	 59mMZ2MKK40tXOQIXKnViIBvcf/qMKXoyX8EAFHsUjiIwRiDaIaZM7/lRATXJRyFwN9t+
	 jylHGylTD9DHExahO+8L7fLGONrzP2JZ61RXRMSpoz0QjiCuo0XUUdxneJ1YWJ1qRTYFH
	 YEFG6AUgVp49XGZu8UUrFSa154aWiTsOj5djUT322vXJKcxpJx1CQ+S0LzLgg5F0rioQ/
	 EzFDt0C/WospS3vWJ8FD7LzNSVJAOb7hbfSwuNYZcu2RRY40QUIp6TVvtV3ZySEXm/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908180;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=M7KNGdpx2i/AmmS1+Byv0+ZgaBgPY2uq2xeQiT+keAU=;
	b=bRNiu9Y3gwJx1zdX+xCSn6kpWpmgfm/qS/1PLyTVbeZr43VnCKs/SUAonMBgcvQO2Fd8
	 4g26zLApLEFAdXUKpOytb5wloSn70O12+VTw7sVpBglDTGLKxJYl4j9847GFtxIT5Is0B
	 0/kgg46mzKJT0XNjC5b8ru+BKTscfzx9r2SbxPr9GjpPQSagX3gajMy3ZmVqeWVVAPr3l
	 kaCaFjC53/DgO8p6pD27t3qF11XSAyekHdIKgNYhhGfkortTl8hVMUNSHeM/wS1SYEenR
	 QaA7ip5AzEokPp/qE+ObJrVawwciLumDeirAecdGQEAq0PPAhy0Jqt0Mkex0UuTcHvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kf5VH4Lc;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2B26075300
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA2B26075300
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kf5VH4Lc
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5547460221;
	Thu,  5 Nov 2026 19:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275921F008A2;
	Thu,  5 Nov 2026 19:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908179;
	bh=M7KNGdpx2i/AmmS1+Byv0+ZgaBgPY2uq2xeQiT+keAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kf5VH4LctFatk6QfTSC9l2Zq5DIdDxDbiocaT53RxB5PZgnwJbYXHqXYskqa15x55
	 ivaB3B3fv8jl6A7hAuWJ6iF9gZy7wwXbs5dz5rhFLKUam6nHeRCS7IMsZRh+8qJJWZ
	 3oTfWxO8O50TI8zaNLVLummUy2H+F+f3WhDwx0BKzaSLT/yVx3UmsGnVkYw5m8Y48/
	 C8wmhXX+V1RZQdDf6orNHcGku00f/860bMGYlu8Xt0LPq5cght5qJ9ZJmC+8K8KLX2
	 T/UjpIt/kXoaf7HlsGh4+lP+LcFRCHjTGoj5qQPEMgSxlZtw1N7WNE5HwXyLGDQKKc
	 QzqmZeKavsbhQ==
Message-ID: <sashiko-outbox-200001@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 15/26] scsi: esas2r: let procfs copy the ioctl
 argument of the ATTONode file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Brauner" <brauner@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, "Jann Horn" <jannh@google.com>, "Josef
 Bacik" <josef@toxicpanda.com>, "Chris Mason" <mason@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, NeilBrown <neil@brown.name>, "Eric Dumazet" <edumazet@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Al Viro" <viro@zeniv.linux.org.uk>, "Jonathan
 Corbet" <corbet@lwn.net>, "Christoph Hellwig" <hch@lst.de>, "Greg
 Kroah-Hartman" <gregkh@suse.de>, "Joel Granados" <joel.granados@kernel.org>, "Kees
 Cook" <kees@kernel.org>, "Jan Kara" <jack@suse.cz>, "Jan Kara" <jack@suse.com>, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, coreteam@netfilter.org, kexec@lists.infradead.org, linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org, "Takashi
 Iwai" <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, "Chuck
 Lever" <cel@kernel.org>, tytso@mit.edu, dmitry.torokhov@gmail.com, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Anna Schumaker" <anna@kernel.org>, yukuai@fygo.io, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>
In-Reply-To: <20261104-work-procfs-drivers-v2-15-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-15-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:36 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] scsi: esas2r: split declaration and initialization of __free() vari=
able in esas2r_ioctl_handler()
--

commit 6197b49c6d17310202283a54ea188828c65f914a
Author: Christian Brauner <brauner@kernel.org>

scsi: esas2r: let procfs copy the ioctl argument of the ATTONode file

This commit factors the core ATTO ioctl handling out of esas2r_ioctl_handle=
r()
into esas2r_ioctl_buf() and wires up the procfs entry to use proc_ioctl_buf
with a table of supported commands so procfs handles copying the ioctl buff=
er
to and from userspace.

> diff --git a/drivers/scsi/esas2r/esas2r_ioctl.c b/drivers/scsi/esas2r/esa=
s2r_ioctl.c
> index 80ae5b9d45db1..901c5d40cda8c 100644
> --- a/drivers/scsi/esas2r/esas2r_ioctl.c
> +++ b/drivers/scsi/esas2r/esas2r_ioctl.c

[ ... ]

> @@ -1516,19 +1502,43 @@ int esas2r_ioctl_handler(void *hostdata, unsigned=
 int cmd, void __user *arg)
> =20
>  	}
> =20
> +	return 0;
> +}
> +
> +int esas2r_ioctl_handler(void *hostdata, unsigned int cmd, void __user *=
arg)
> +{
> +	struct atto_express_ioctl *ioctl __free(kfree) =3D NULL;
> +	int err;
> +
> +	esas2r_log(ESAS2R_LOG_DEBG, "ioctl (%p, %x, %p)", hostdata, cmd, arg);
> +
> +	if ((arg =3D=3D NULL)
> +	    || (cmd < EXPRESS_IOCTL_MIN)
> +	    || (cmd > EXPRESS_IOCTL_MAX))
> +		return -ENOTSUPP;
> +
> +	ioctl =3D memdup_user(arg, sizeof(struct atto_express_ioctl));

[Severity: Low]
As reported by Sashiko on RFC [1], this isn't a bug, but in
esas2r_ioctl_handler() in drivers/scsi/esas2r/esas2r_ioctl.c, the ioctl
pointer is declared with __free(kfree) =3D NULL at the top of the function
and then assigned via memdup_user() after the early validation check.

Per the cleanup.h conventions, could ioctl be defined and initialized in a
single statement at the memdup_user() call site instead of declaring it at
the top of the function?

[1] https://lore.kernel.org/r/20261102-work-procfs-drivers-v1-14-a994bd4d3b=
1a@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D15
