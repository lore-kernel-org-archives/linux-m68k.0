Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663571;
	b=4PJa7BhjR6N4YQRCZHeQqaKewt3htgRj8t/vBVUtCBtWOeVAG9KstMO5VNRcaWtnxDAl
	 bWmG0cyDvN4JxAft7QEDNWvSOLOyHEDKs5rsTyEgbMHUz91AVKrRBi9LbFxW3l0WslhVb
	 sw0YMck8/Fv4ctrCvWd8sulHVE4e21HieR2lefm/lJ108Bg9kkHPOkYgfHF1Y0ZN2sat5
	 pfj1tMAGtOezCrRgLA2DU1NBlPh0qLVb5RpWGsaSgKakLCel72p1cBLxOrU5E/tHo4msT
	 d3YgS6t6svZBq+qEXKKCXaYlmJTd7BBNoS2xtVVzFYf7uokWvkXSMBcwB0BtlZNod4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663571;
	h=DMARC-Filter:Received:Received:DKIM-Signature:To:Cc:Subject:From:
	 In-Reply-To:Message-ID:References:Date:MIME-Version:Content-Type;
	bh=ofJy08aWX1//YrHoygi/IkjCsi3MA9HBCDQXykemzuY=;
	b=A8pr8h7TUnXsUiePC6KKieyP6PmbkpgHjzG8N23rcxbEWdW3ivjSY9y2XA6JQg4bOrch
	 2VdqXbnwfuNObbsUYkndjPOdbI3YRinqkgy8lGb19gU9J2mJHnQNxe8pqcnR6aO5A4P1g
	 OTuon3rKHsxhB9JRx+GNxW+Byp03DaezV3CzkSKEggY2+EFfmPcIR+QCM9SzQV/Hhuaa1
	 DDpahd9sF7cr/myNsr6rx8kY8nF/gQX59ANrvsWgf7mg0cb/YwJ85J/VGdnMcoxEhClf6
	 5+0o7BXzF1u0ezFfTQkwMYZCc5lo3eL5nc6GPgx8gTbcaww0TPTATntdYYPqbbInBxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GLrXlgFG;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DB8606A32A
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 03:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DB8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GLrXlgFG
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0C954619B;
	Thu, 26 Nov 2026 03:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C245D1F000C6;
	Thu, 26 Nov 2026 03:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795663570;
	bh=ofJy08aWX1//YrHoygi/IkjCsi3MA9HBCDQXykemzuY=;
	h=To:Cc:Subject:From:In-Reply-To:References:Date;
	b=GLrXlgFGpqdk1+lX+eHjW0IqPI+8at1Y3kYciPFt7X3TYN1IQrBZmph+i0hntghM2
	 17OUOXX6kmRgRRDZpRl1+eiBb4owmtjaT1eK4Wh+PrVleJ8L7rVoDjf0t8boKetB16
	 7SMw38QDMKyJntDxIBBb0QmxIiSA4zt1N/eD7oPy6Auc/bWOel4MQy9Bc4cHzh31ys
	 fXSWW5BIC7JWW9yKvmS3UenSF/LGQqU0bZtPMjGmQ9L7WSZ/7zwRlOZ+CeLrFZ6cso
	 FULKOF45mlbt5u9lP4QN8/AUp4er9E3WlUWU+6frOUPlc9Z/swBANxVQ3ncK/UDFi4
	 dCn7AEL/WSutw==
To: Ziheng Wei <zihengw03@163.com>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
  "Martin K . Petersen" <mkp@kernel.org>,  linux-scsi@vger.kernel.org,
  linux-m68k@lists.linux-m68k.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] scsi: 53c700: fix invalid frees in m68k driver remove
 paths
From: "Martin K. Petersen" <mkp@kernel.org>
In-Reply-To: <20261122160447.519889-1-zihengw03@163.com>
Message-ID: <yq17bi0jmt4.fsf@mail.kernel.org>
References: <20261122160447.519889-1-zihengw03@163.com>
Date: Wed, 25 Nov 2026 22:26:08 -0500
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain


Ziheng,

> NCR_700_detect() stores the allocated host parameters in
> host->hostdata[0]. The m68k remove paths instead use shost_priv(host),
> which returns the address of the pointer slot and causes an interior
> free.

Applied to 7.5/scsi-staging, thanks!

-- 
Martin K. Petersen
