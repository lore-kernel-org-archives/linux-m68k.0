Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DF7328611
	for <linux-m68k@lists.linux-m68k.org>; Thu, 21 May 2026 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779376485; cv=none; b=i0TdSh16Ssr2ILmaQbZ7UjNPNNmmXYD9DbMvUF1gIQhvMQCm2smo41VSc/UMi3A/52anU/2O1IxKwsweStB92xXR9iOWPV1NN8Xd5PryFSeAD9Ke9klR7TGVEWY3zmR7O4vAfCcuhLDjJ/sl6c/Pgub40H9FPGyFj3QraFwO7Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779376485; c=relaxed/simple;
	bh=5i63jLVo1UEC8APqkf5OrG1+iavra/VzvKZO2aYj62Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Tjr0VWs+ohDV40rAFk7k/tSMbJRQDXKHG7aHiEqDQOkcrVvfe2whk97CsYzvaqXrsp+xPQcqhpFr0xp45ZGrSPo9N116lnlhbpdWOVDpg3LB6hFmOVmZBdX+YkwwfiE1kVvH+ULVlU1zxp+WXHmKTfYC5iKoSlpuCNiDYZkk2ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gLsQM0B8Qz1rCnC;
	Thu, 21 May 2026 17:14:35 +0200 (CEST)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gLsQL5kgyz1rCn7;
	Thu, 21 May 2026 17:14:34 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gLsQL52nYz1qqlR;
	Thu, 21 May 2026 17:14:34 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id axROFTRxcJpi; Thu, 21 May 2026 17:14:34 +0200 (CEST)
X-Auth-Info: WoT88ex07Ix/hqXbNzPmR0gYy7n5FeJ1Tlu8lIS6pbDfavPz6h4RymQB85tbY4Sd
Received: from igel.home (aftr-82-135-83-49.dynamic.mnet-online.de [82.135.83.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 21 May 2026 17:14:34 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id B28772C16E1; Thu, 21 May 2026 17:14:33 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Marco Elver <elver@google.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
  linux-m68k@lists.linux-m68k.org,  linux-kernel@vger.kernel.org,
  kasan-dev@googlegroups.com
Subject: Re: [PATCH] m68k: Implement _THIS_IP_ using inline asm
In-Reply-To: <20260521123438.147789-1-elver@google.com> (Marco Elver's message
	of "Thu, 21 May 2026 14:34:30 +0200")
References: <20260521123438.147789-1-elver@google.com>
Date: Thu, 21 May 2026 17:14:33 +0200
Message-ID: <87h5o0zteu.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mai 21 2026, Marco Elver wrote:

> version. Additionally, avoiding taking the address of a label prevents
> compilers from emitting spurious indirect branch targets (e.g. ENDBR or
> BTI) under control-flow integrity schemes.

Ignoring the fact that m68k will never gain such a feature, dot is still
a label.  If you want to avoid a label, you need to use %pc(0) (or
%pc(-2) for an address at insn boundary).

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
