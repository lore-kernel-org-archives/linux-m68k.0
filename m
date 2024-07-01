Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C509347B4
	for <linux-m68k@lists.linux-m68k.org>; Mon,  1 Jul 2024 08:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719821286; cv=none; b=VvEMFnOKKTisSNNx5bLTn0zQuLUfuAwQ+t0a4JB+5wDpWqsqOfCRjzlw/tH+mvdNM6rdUl7OTtQt46CX/H/TK7w7wOWEcqZ3P3mmTxlzv/HbYeUJD+S9tco4XHRcLMbdb1/yv+4blTWvL8th8YaEVORFC0V8aVNehBB2BokqCzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719821286; c=relaxed/simple;
	bh=JIw6hjNSNRt5LayvFt5RRTqGlWTbe6H3CJU7LJXduis=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I33B5D61zkuEBPxyG/x/9tkuxOyWlfD83a7TLZyyrzgRhX4CvOqE9dto8gspvYD3WrTo8jQTLZap6HEpF/NxFdthJuq3OvN81LGpOcZRWw2pjqHA0k8p2jXWoEiFYBeevMh22JdYfeIA1pX/raJad3wF745y6tXU54E7YZ+QG60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=212.18.0.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4WCJQk48fkz1syBw;
	Mon,  1 Jul 2024 10:01:34 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4WCJQk3KFkz1qqlY;
	Mon,  1 Jul 2024 10:01:34 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id aOkZ3z2766x9; Mon,  1 Jul 2024 10:01:25 +0200 (CEST)
X-Auth-Info: wbSlFLtAlZYzP+qzJRT26bvEYztCj0/Z+VZBl+7Ts8eeYQOHTk/mYU/mXaYQCS6J
Received: from hawking (unknown [81.95.8.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon,  1 Jul 2024 10:01:24 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>,  Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>,  linux-m68k@lists.linux-m68k.org,
  linux-mm@kvack.org,  linux-mtd@lists.infradead.org,  Geert Uytterhoeven
 <geert@linux-m68k.org>,  Christoph Hellwig <hch@infradead.org>,
  wbx@openadk.org
Subject: Re: m68k 54418 fails to execute user space
In-Reply-To: <b6eb0a0a-b7db-4e51-8504-27073d8a7246@linux-m68k.org> (Greg
	Ungerer's message of "Mon, 1 Jul 2024 08:35:16 +1000")
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
	<735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
	<7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
	<a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
	<c7235957-1f00-40dd-a78a-925b0b943ec7@gmail.com>
	<57879ac8-eaf5-48f1-b4ef-6619d9108440@yoseli.org>
	<d66e2daa-8b31-727f-bd66-6976b0bc0130@gmail.com>
	<ce18844d-9a93-40c7-9ac6-b49b8f823c47@yoseli.org>
	<64c30829-499d-fb48-16ee-891f8d8c443a@gmail.com>
	<b6eb0a0a-b7db-4e51-8504-27073d8a7246@linux-m68k.org>
X-Yow: Does that mean I'm not a well-adjusted person??
Date: Mon, 01 Jul 2024 10:01:19 +0200
Message-ID: <mvmed8dlewg.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Jul 01 2024, Greg Ungerer wrote:

> I am not sure why JM's link has applications linked at 0x70000000.
> Is that a glibc thing?  My examples above are all based on uClibc.

No, it is defined by the linker (TEXT_START_ADDR).

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
