Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA01ABC36
	for <linux-m68k@lists.linux-m68k.org>; Thu,  4 Jul 2024 11:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720091482; cv=none; b=PPK7ihGsH9VXKF7ZzP7N7NNu3OEDzjt8KB5er9Jlv+2FCwz1iCVmgvkDG3CX1B8VPa1ZBDqMXEbdHA1F8GjT29pL9QGwu/0X4EXpIb0mGDkafkrFfoVE1M5vcW4ShJE4zeUv22tqVWCpIwk2PRGpjtalQhMQc2cWfQGDtJBZYfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720091482; c=relaxed/simple;
	bh=TwoVc/A5cvcKyYqBk85IeSoXm8WueZBsy4xxLnttTxM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tmwlqUlopYjHTOcnxa3V9+3j8EqLLbnYgx82qagPMZLyfpFxuBeT4b/djFcZQayRN9XbAO3OIG9al09zvhY24BWYjfvlsbnk/BATtaNP8UBqgVk4wONiv1uu7h3Ylgvui80xSvJ7coyAtAs0Y1bIDclyRnYsnEG/h0YvJ6WcyxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQJYE+Ke; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQJYE+Ke"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3626c29d3f0so329820f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 04 Jul 2024 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720091479; x=1720696279; darn=lists.linux-m68k.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwBmB9TZGFjcG5R2+2N2tz93DvezoEGxh6PsIk8IO/w=;
        b=gQJYE+Ke+asfsjma70ecirtwX5RmfzyjBOgqn/u988N0ndsg0osu8OfY/yRtmTgZ6q
         rFzN5Ne41nFKp1aK05vKcfN13tqkpdII+PPONGOD/Z1TAnhOe6uDAYVKYUij1H5CrmpJ
         B1+mCnNExz0Y+Z33R/4Qmt2hVPZXDiVhguy84AJxRea4Ttnl6yBH24YesZY9QrzIlFwr
         GvLPVU1OpVaySvaLei08zdRCoieQ0pnaHWE7IGEc9A5j+tnL9LSqpG/Qh1mJ5XLK3Lei
         eOLUscNfjxeuPJL+3UGANAWfZJwCBHpVV1mZrP7kZygqLIcttb9M/HA0uavPmSRrkrcx
         4yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720091479; x=1720696279;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwBmB9TZGFjcG5R2+2N2tz93DvezoEGxh6PsIk8IO/w=;
        b=hUqv9k0g4JKKITwCMG83ORA2nOgl/JnXL+AN/U4YKCN/R3CeEqoYoTeUp5VOfdekb4
         D4pwICVMJvjqjwUvhjL3WdpwBUigCUYpH2fHGCWLqsMQnRafFu/hF/xJmL0FL/9IbY1l
         zzFxMSSkAmm4EVTUYEeLahh80rexulJLZ5bBrCB2qgYEvKUzJds9qnxLi32z/eAp5DVT
         nfrd3SWJ1p9AjwmTKWeJRrwwGb03mUE2Sd+dmVQLvoWWKfxjCHaOYdtfxNA2RqtG/Xjy
         1/7XiSRzAL8EnNhXA/uV840nrV41pwAA6oHAU86a7/68aqBExC32IUUTBtk4geWxECIw
         Hn8g==
X-Forwarded-Encrypted: i=1; AJvYcCWBw1pEaV3BRi9kHL7tgOJeSvOyz8lym0g35FrxXkHMULlfIj6zVtLwKD4NAOkeOS9KShQHkhI96q933Qn99KNJgCO2RS8/vvpNo0Vjsh7V
X-Gm-Message-State: AOJu0Yzsk1/Efx/CeqDEbpZfjfyb/6soAa0B023UD7mCNF3Br3YTFn5S
	pBbIya/h1HLkAppScc359tIhjRZRKEOtb+EmOvvGj8bjY7Ep0Tus
X-Google-Smtp-Source: AGHT+IFEzvL2jC2faLe/uaMvaq/UCJ26KrH1XFm9Ol6h8w0Rebt6hjx4X+gdY7pIVUfbtqQYexMuPw==
X-Received: by 2002:a5d:5712:0:b0:367:94e7:958a with SMTP id ffacd0b85a97d-3679dd17ec1mr1153338f8f.6.1720091479417;
        Thu, 04 Jul 2024 04:11:19 -0700 (PDT)
Received: from [10.14.0.2] ([139.28.176.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36787db4d12sm6821051f8f.110.2024.07.04.04.11.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2024 04:11:18 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH 14/26] block: move the nonrot flag to queue_limits
From: Simon Fernandez <fernandez.simon@gmail.com>
In-Reply-To: <ZnmoANp0TgpxWuF-@kbusch-mbp.dhcp.thefacebook.com>
Date: Thu, 4 Jul 2024 12:11:16 +0100
Cc: Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?utf-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>,
 Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org,
 linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com,
 nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org,
 ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org,
 dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org,
 linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org,
 linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <78BDDF6A-1FC7-4DD7-AABF-E0B055772CBF@gmail.com>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-15-hch@lst.de>
 <ZnmoANp0TgpxWuF-@kbusch-mbp.dhcp.thefacebook.com>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)

Hi folks, how can I unsubscribe from this group.?
Thanks in advance.
S

> On 24 Jun 2024, at 18:08, Keith Busch <kbusch@kernel.org> wrote:
>=20
> On Mon, Jun 17, 2024 at 08:04:41AM +0200, Christoph Hellwig wrote:
>> -#define blk_queue_nonrot(q)	test_bit(QUEUE_FLAG_NONROT, =
&(q)->queue_flags)
>> +#define blk_queue_nonrot(q)	((q)->limits.features & =
BLK_FEAT_ROTATIONAL)
>=20
> This is inverted. Should be:
>=20
> #define blk_queue_nonrot(q)	(!((q)->limits.features & =
BLK_FEAT_ROTATIONAL))
>=20

