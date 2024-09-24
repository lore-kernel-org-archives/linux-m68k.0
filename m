Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA2F13BAEE
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Sep 2024 21:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212163; cv=none; b=FUGWcJtYkbfu0DecmEbrniPidGfGiqo76CLEbDaDTrI7wPImFvdr8q0c/fqk/jMg4PbIVZpDFMp3UuazYTG1XGPC5h/Lry7le5LMPh6R8oSewDrmSUDg8xBOeGwAgAtbxiqX5VENk6VMDEpzIBETBerDwy+BHZanEe2dgGcHd1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212163; c=relaxed/simple;
	bh=jrM+tXUMIEk7tV6M7P+T/eCGvQ/ed0Y3/amZepD+vgk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f86MbfJn0vQl40yRHB+gMV2uqeB2Bpq78XUPGacWyfUMEWHQkTjmARSXpoTID3telIiWGHLgIfAjzoFkAhgT2rMlGZ+JdY+FKkKsfROKPxweKKdh5ExTw0eyOUXzJuZRCeedLj2o7GbQ+hGXQKHyd7FIAvb3Wwci8EOKRVG7pLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4XCstG6PDBz1qtr4;
	Tue, 24 Sep 2024 23:09:10 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4XCstG6411z1qqlS;
	Tue, 24 Sep 2024 23:09:10 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id YAiDTB5aKZ6J; Tue, 24 Sep 2024 23:09:10 +0200 (CEST)
X-Auth-Info: ZwtpsqghtX7IRrf8R6N+ewpVJEYMPnPKU24v16LKuHR73xM70psY99Nvk0g6/wTZ
Received: from igel.home (aftr-62-216-205-79.dynamic.mnet-online.de [62.216.205.79])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 24 Sep 2024 23:09:10 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id C4FE82C19CD; Tue, 24 Sep 2024 23:09:09 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Eero Tamminen <oak@helsinkinet.fi>
Cc: Michael Schmitz <schmitzmic@gmail.com>,  linux-m68k
 <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH 1/2] m68k: Drop Atari EtherNAT support when it's not
 configured in
In-Reply-To: <eed880a2-8c02-40d7-813b-c6e8f1b8c197@helsinkinet.fi> (Eero
	Tamminen's message of "Tue, 24 Sep 2024 23:58:33 +0300")
References: <20240922214821.16818-1-oak@helsinkinet.fi>
	<4540348c-84f6-4993-97b5-f007771be444@gmail.com>
	<eed880a2-8c02-40d7-813b-c6e8f1b8c197@helsinkinet.fi>
X-Yow: Quick, sing me the BUDAPEST NATIONAL ANTHEM!!
Date: Tue, 24 Sep 2024 23:09:09 +0200
Message-ID: <877cb03gju.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sep 24 2024, Eero Tamminen wrote:

> Hi,
>
> On 24.9.2024 4.03, Michael Schmitz wrote:
>> On 23/09/24 09:48, Eero Tamminen wrote:
>>> Not having it configured, but crash backtraces going through its IRQ
>>> handling code, is confusing (found while debugging issues in Atari
>> I don't see how backtraces could go through the EtherNAT interrupt code
>> - the interrupt only gets enabled if the hardware has been detected.
>> Maybe you meant you see the generic IRQ handling code called for the
>> EtherNAT's interrupt controller?
>
> It was many years ago, but I _did_ see one of these functions in Hatari
> debugger's backtrace, although I had explicitly disabled EtherNAT support.

That can easily happen if a word on the stack happens to match the
address range of an unrelated function.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
