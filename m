Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233CF53AC
	for <linux-m68k@lists.linux-m68k.org>; Sat, 29 Jun 2024 07:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719644806; cv=none; b=XiKTZTIDEXfhP4/BbuWtbpjU0MsbTjSlyA/aMF/etvFjmTXfVoUlZS0TpEHtoV+9JTSe2kw7nN20doy1182xzlOEkRlexUFW0i1thf4jhI32cDCpn97tktoDdUeAFvgNkuWGOai9cqKle7yi5Ey3JNiTSlcOiQxKqSE6zaOYi6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719644806; c=relaxed/simple;
	bh=ViUy0ctu8TPLgFyWuJhYn0hLfF8k+fM7sLdDcTeeDI8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qh2/diliWA+SCwtc/+3IKdiNY2VMSj56eyYF7SpzvSWT9yU7YzDLsm7nEi8JvtPezoB0miPuXTgCwcBQr3vs0P1ae9yj5Fbxn/joQsdsuajH8CKhQDMr7AY/UOflt21EjoG2npO8B7q3R/OZ1HwDlwUVYzIiRUJJaR2vsLbVPso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4WB3690ptNz1qsPT;
	Sat, 29 Jun 2024 08:57:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4WB368728lz1qqlS;
	Sat, 29 Jun 2024 08:57:52 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id i6ARBl_8mE74; Sat, 29 Jun 2024 08:57:52 +0200 (CEST)
X-Auth-Info: jPxR6pkkUhklqMdqkUWWtm7xg8PWuQPlt3iIHPTbh+8SVFBPW8o95hyzi42MYyuY
Received: from tiger.home (aftr-82-135-83-135.dynamic.mnet-online.de [82.135.83.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat, 29 Jun 2024 08:57:52 +0200 (CEST)
Received: by tiger.home (Postfix, from userid 1000)
	id A79D12A7A83; Sat, 29 Jun 2024 08:57:51 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
  linux-m68k@lists.linux-m68k.org,  linux-mm@kvack.org,
  linux-mtd@lists.infradead.org,  Greg Ungerer <gerg@linux-m68k.org>,
  Geert Uytterhoeven <geert@linux-m68k.org>,  Christoph Hellwig
 <hch@infradead.org>,  wbx@openadk.org
Subject: Re: m68k 54418 fails to execute user space
In-Reply-To: <8ba7fa44-876e-5f7b-70c8-e8a5499db2a4@gmail.com> (Michael
	Schmitz's message of "Sat, 29 Jun 2024 15:41:50 +1200")
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
	<735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
	<7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
	<a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
	<c7235957-1f00-40dd-a78a-925b0b943ec7@gmail.com>
	<57879ac8-eaf5-48f1-b4ef-6619d9108440@yoseli.org>
	<d66e2daa-8b31-727f-bd66-6976b0bc0130@gmail.com>
	<ce18844d-9a93-40c7-9ac6-b49b8f823c47@yoseli.org>
	<64c30829-499d-fb48-16ee-891f8d8c443a@gmail.com>
	<04ffd421-28e8-4bde-b44b-e3685bed99fc@yoseli.org>
	<8ba7fa44-876e-5f7b-70c8-e8a5499db2a4@gmail.com>
X-Yow: On SECOND thought, maybe I'll heat up some BAKED BEANS and
 watch REGIS PHILBIN..  It's GREAT to be ALIVE!!
Date: Sat, 29 Jun 2024 08:57:51 +0200
Message-ID: <87msn4z15c.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Jun 29 2024, Michael Schmitz wrote:

> No heap space allocated here. I would have expected that to cause an error
> message from libc ...

No, the heap starts at _end and there is still enough space before the
next page boundary.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
