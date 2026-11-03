Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717306;
	b=v1zwrz376JXKBwwLSO2bBIaGqlS5t7BVAqYgE3HUr0HDc3TOvhoJZnkNb850kPaO3jaH
	 xWs1haBBjNBhGOMvQ1xps6IKMD0E3R4ksKcl2/BvWa7j9zG93ROATyk9ebsluoYVJfsFK
	 apYej2ry/U5SbX4yAad8u+aVG/yDMDTyeEYpFr+1uXXpRNHZpmWMdQjmiIebNDuFmNLyS
	 dnHa7OEG/4pYoWOl5Ng7rhS66GZUpNLwhJtTJIqHFGJ1nbOnO1J8VlPLqcaNrOwvql2TY
	 dr9yP6sNNKWjc7oJKe1nNHSkEThrBG8sFmpQlqk+5QJhvE1gUMVJddc/wZtFcRNt6Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717306;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=c0x/bwvUTy91TeSNlshE2x6EC5UWF1SAOxo9ylrayLg=;
	b=mPCaIEB5jL0owCeZx3QVCQVT1tvqgAsk3+2uGuyRCGTxfXmMT3cXfw1NqLHXwh1BPI70
	 CKRYRuyvoaTKbJ7ka7spfMbH2TZhfUQR4T7rS6X9AUprh7YZR5hrhBY1rdCastqO1MeCd
	 aHGwo6mhCaASCRPht8B5mKvG+qOTElIKhhLuVbHJM8+tQAJfg1NnwJUBjOOlr9p5cAX3c
	 Kb/IqgYrVbE80qIjjai+doJak9SQWMuoFGZurMxOR4gH3CT3fl6Fpjn9adLV0ezOx0NLn
	 I1lwrj489xBjInuZ2fjrpD4BQLPDsW071WzcEf4eeuIuxDYQtVFn+qm9wbG1T04chZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bqxUBmmI;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC84606B263
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBC84606B263
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bqxUBmmI
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 23DA8609F6;
	Tue,  3 Nov 2026 14:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29171F000C1;
	Tue,  3 Nov 2026 14:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717304;
	bh=c0x/bwvUTy91TeSNlshE2x6EC5UWF1SAOxo9ylrayLg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bqxUBmmIruc8WVpdDnTaZKZMybp6tbdqSNtX5Vxb8SbRLH8Zr2JWwBPY98aQ3hFcO
	 mF4KERe0Pl6zVdX7ZTe2YfvSwUDpjVOk0tXjo8nokMnupOaJWZpwf9x3s1jjDqLc7o
	 D8x2o27+nwq7964W+Sy/E0e8KLqKLtVO62ftCwu5g7mpOe3sE4UYTyU1eKEd9wvkG6
	 9ziGsoyYsjc+8FEQzGARNtSKo/GIQynC+oiEc7kqzm/+yyy218WWaRIIGwPjaGFK1d
	 0aiHWvAjGKyvLg2SLb3ZdKLVkElsDVk3YwkpAFqEpwcF1NBvaDa6WRGXNTZsB/rjMv
	 m/ZkDBbjhFEUA==
Message-ID: <sashiko-outbox-195500@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 28/38] scsi: esas2r: bound the lengths of the HBA,
 SMP and firmware ioctls
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-28-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-28-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:48:22 +0000
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
- [High] scsi: esas2r: TOCTOU race on data_length in handle_hba_ioctl() via=
 read_hw()
--

commit 8af21917bc01e9991b2ab872e7a4c38c91a6e388
Author: Christian Brauner <brauner@kernel.org>

scsi: esas2r: bound the lengths of the HBA, SMP and firmware ioctls

This commit adds bounds checks on user-supplied lengths for the HBA, SMP,
and firmware ioctls in esas2r to prevent out-of-bounds reads and writes past
the end of struct atto_express_ioctl and a->local_atto_ioctl.

> diff --git a/drivers/scsi/esas2r/esas2r_ioctl.c b/drivers/scsi/esas2r/esa=
s2r_ioctl.c
> index 3f7c1d131ec34..f99318f61c934 100644
> --- a/drivers/scsi/esas2r/esas2r_ioctl.c
> +++ b/drivers/scsi/esas2r/esas2r_ioctl.c

[ ... ]

> @@ -1221,11 +1231,16 @@ static void hba_ioctl_done_callback(struct esas2r=
_adapter *a,
>  	}
>  }
> =20
> +/* @room is the size of the buffer that starts with @ioctl_hba. */
>  u8 handle_hba_ioctl(struct esas2r_adapter *a,
> -		    struct atto_ioctl *ioctl_hba)
> +		    struct atto_ioctl *ioctl_hba, size_t room)
>  {
>  	struct esas2r_buffered_ioctl bi;
> =20
> +	/* The data follows @ioctl_hba in the same buffer. */
> +	if (ioctl_hba->data_length > room - sizeof(struct atto_ioctl))
> +		return IOCTL_INVALID_PARAM;
> +
>  	memset(&bi, 0, sizeof(bi));
> =20
>  	bi.a =3D a;

[Severity: High]
Can a concurrent write_hw() bypass this bounds check when handle_hba_ioctl()
is called from read_hw()?

In drivers/scsi/esas2r/esas2r_main.c, read_hw() and write_hw() both operate
on the shared a->local_atto_ioctl buffer without holding a driver lock (and
kernfs only serializes per open file description via of->mutex, not across
separate file descriptors):

drivers/scsi/esas2r/esas2r_main.c:read_hw() {
	...
	if (handle_hba_ioctl(a, a->local_atto_ioctl,
			     sizeof(struct atto_ioctl)) !=3D IOCTL_SUCCESS)
		return -ENOMEM;
	...
}

drivers/scsi/esas2r/esas2r_main.c:write_hw() {
	...
	memset(a->local_atto_ioctl, 0, sizeof(struct atto_ioctl));
	memcpy(a->local_atto_ioctl, buf, length);
	...
}

Inside handle_hba_ioctl(), ioctl_hba->data_length is read twice without
synchronization:

drivers/scsi/esas2r/esas2r_ioctl.c:handle_hba_ioctl() {
	if (ioctl_hba->data_length > room - sizeof(struct atto_ioctl))
		return IOCTL_INVALID_PARAM;

	memset(&bi, 0, sizeof(bi));

	bi.a =3D a;
	bi.ioctl =3D ioctl_hba;
	bi.length =3D sizeof(struct atto_ioctl) + ioctl_hba->data_length;
	...
	return handle_buffered_ioctl(&bi);
}

If write_hw() overwrites a->local_atto_ioctl->data_length with a non-zero
value between the bounds check and the assignment to bi.length, wouldn't
handle_buffered_ioctl() still read and write bi.length bytes past the end of
a->local_atto_ioctl?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D28
