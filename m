Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898853C4B83
	for <linux-m68k@lists.linux-m68k.org>; Fri, 11 Sep 2026 07:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112398; cv=none; b=cB8POHGiB3jffL05BbzYI5dZcaZADTWPrsHaFJrHMBewXTMMFHga1+ASSDJ6J52+1dwr/Q+9A8laCkxPhCEZ8siMpuPUIccexYOh9TqO0S2066e9JTaMUHWnV8C4TFYKVGMUIenohSPE4JJ5g+TrY7bF1/KwV0VoJI4OUbDVcmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112398; c=relaxed/simple;
	bh=ZgYSd8aSl+pmQF6s/I8l4yrW1KO+BynqDj3sGwPHoJQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Dzt7tFPi9/d8L9KV990nN/xHIligMvgOBqz3kqCMjzULy8QLf5NF9u2Dc6BJjQuexSPayJftyywXwb1i/tKpCljovP2jtD8WkNC3T2OENQNaUno3nGh6oPhsy7Zc7cJmhYUtgwcEQbqt0/liSHzPW3l2WnBSMYPzwJCNOZRTUL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeYohwzC; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeYohwzC"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77C93601EF;
	Fri, 11 Sep 2026 07:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5E81F00893;
	Fri, 11 Sep 2026 07:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789112395;
	bh=cNDwBPzZ/WbyatJG45pDIM0SmtwpbVp9K9FOPow1htE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=GeYohwzCkm6RSLb0GGMVx5stnsk6b3KFERhiGSSY+NRAUG9+6mXVQXvjAqVARhG1e
	 TOJnxECgW9tnbJEh8CPVcSxCk4wjDs8NLdK2444M3gvrvdbWv8apAixaPlMRAW5Hqy
	 ZjKsL4lIi3KZ/tOLB8fY/dSvrMgAxc/L4zSnUEPRWL0Wo7OBrK7fcXiA9ehzEKg6HP
	 uebPTgKglItE/cZNcJNS3OxVvebZljMMtmzNYUUjsgGslawR9OU+9+2SAuEn12WE4D
	 dJAlEKier+7ktpVrKcquXQkj+pCqtc+Jc1c9o1Y29TDz66g4htMFPJ0572QNpNHI8U
	 3b0Q/51yJH7ng==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 71440198005A;
	Fri, 11 Sep 2026 03:39:52 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 11 Sep 2026 03:39:52 -0400
X-ME-Sender: <xms:RbCjag87uT0jlqi4Yg_5Uvr0xQCHB0WIfCiPY_hbSp1OkUeusaKHnQ>
    <xme:RbCjajhzUAJ2BpiN8lY97QX-nh7V1KgtItx7JUIFyU0uwPTpLpRr4c4JHHLq97tzv
    oelFNqbJDRb4LQXySnE2CLtB5aKDcleSXspqzZ2ZPYT0jyeV4_RSsmx>
X-ME-Proxy-Cause: dmFkZTFynU64fqS/kRaDpbVzG47K+DWiSiGqzNaN0xoei7kNlP/hyfePM3idLtl26nbYCY
    qxB79LlrjrD5olCyJwCrVK3EUEvwHD1y+eKaJjZoijYFFjocQAMqBmaHKHipoSYd8nos42
    kwij7BU96r7JBR08vRHwVth+HTURrxCdAU3TcaGftdk8fK08Nri/x1jLpdsEZAePwjXz0F
    SzDP832JYOH1kMIc32nfKTPvEzHAKQeMEjDKNKBRmieAbytYYsrq1qANtigNQNTOdhQpjI
    2EoBZhXpnf27gByyKA69izcYVy557KtgDnBAbk3DYDDUXMM3z+yT8eY53tmbjO92IveXSj
    hyGg0Fo0cNpCUDFnFN+wwPpxFmIqPRJ0Z9nqC5fskcffWZ0lMUDoNS61F2wM1BzifelDRH
    nhmHHrGmo0kID7W6ms2a/OvNKrJ33hMOYsS51j7ZC62o+pOPYxqA0nod/DByFZfr9P1zbR
    /ZKYmtnHj8tq08mQ009/w+hVCGmSWIhwDio/N0B8044FoOPlAArcqgf/Caioy58J4CM8Ot
    zybpOviMFtya+ZwkObt57s4M4NNqp6xtXDSFhDV8k6BlAMQXjyluSnzVA0OiDTCajQWuri
    Eg3yXZX6CAixGhZOr7V9dg6ZJDsFnQQae7PKhOv44iSjnaNVgRbk7jsG/tHw
X-ME-Proxy: <xmx:SLCjas32yZ2_wJwFZLSdILo6bKIUnO0U_leBnoa1JkoiBZ7lgQWPrA>
    <xmx:SLCjauCgmQKixAx8zeL_t3ZcMLDMQgUR5kiLAuxIsa4uRhvK9yAvCQ>
    <xmx:SLCjap8RYmKQ2UFtu2hpjGwHNYQ_jSBm704I1WnbZUClQw5dNJEyVQ>
    <xmx:SLCjas-S4ET_vfiqzSXe77ot5ZB06BrN9nFh7DOpYy2lAL5ppTDg-w>
    <xmx:SLCjap1wtwpruTTCqtF3mHdUWhx1HfT8KHxTMz0VWDD8u8u53sWMOlZT>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0058432A007B; Fri, 11 Sep 2026 03:39:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A2FgseOyJyxV
Date: Fri, 11 Sep 2026 09:39:08 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Jakub Kicinski" <kuba@kernel.org>, "Greg Ungerer" <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 "Wei Fang" <wei.fang@nxp.com>, "Frank Li" <frank.li@nxp.com>,
 "Shenwei Wang" <shenwei.wang@nxp.com>, imx@lists.linux.dev,
 Netdev <netdev@vger.kernel.org>, "Nicolas Pitre" <nico@fluxnic.net>,
 linux-can@vger.kernel.org, linux-spi@vger.kernel.org,
 "Vladimir Oltean" <olteanv@gmail.com>, andrew+netdev@lunn.ch,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Paolo Abeni" <pabeni@redhat.com>,
 "Andrew Lunn" <andrew@lunn.ch>
Message-Id: <2449d19c-42f3-4ad9-aece-87ce7c3079e3@app.fastmail.com>
In-Reply-To: <20260910174210.0f8a4ad2@kernel.org>
References: <20260907134037.1855408-1-gerg@linux-m68k.org>
 <20260907134037.1855408-2-gerg@linux-m68k.org>
 <20260910174210.0f8a4ad2@kernel.org>
Subject: Re: [PATCHv3 1/3] net: fec: do not use readl()/writel() for ColdFire
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Sep 11, 2026, at 02:42, Jakub Kicinski wrote:
> On Mon,  7 Sep 2026 23:37:09 +1000 Greg Ungerer wrote:
>> The FEC driver works today because the m68k architecture io.h has a
>> kludge in the definitions of the readl() and writel() functions for
>> ColdFire that allow big-endian access if the address of the register to
>> access is within the SoC's internal peripheral registers. This is being
>> fixed in the near future to define readl() and writel() correctly - with
>> no byte swapping. Thus the motivation for this fix here.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> What is the motivation for this cleanup? Is someone still making
> new SKUs of Coldfire boards? Or (and please don't take this the wrong
> way) it was a long standing TODO that was tempting to feed to an LLM?
>
> IMO keeping the hacks in m68k is a better choice. FEC was used on more
> modern SoCs, definitely on PPC ones. So we'll be able to get rid of
> m68k before we can get rid of FEC. Sprinkling m68k workarounds in 
> the FEC driver is backwards.

Coldfire at the moment is weird because it defines the readl()/writel()
helpers the opposite way from everything else. Greg has been working
towards fixing this so we can avoid special hacks for it in other
parts of the kernel and share the code with Arm and other SoCs using
the same peripherals.

fec is an exception to this because it happened to rely on the
unusual macros: all the Arm SoCs using this hardware have little-endian
registers (regardless of whether the CPU runs as BE or LE), while
all the coldfire chips use big-endian registers (and don't support
LE kernels). The powerpc variant of fec also uses big-endian registers
but has a separate copy of the driver that hardcodes this. Other
Freescale drivers already have a runtime endianess detection that
is needed because they built both BE and LE variants of the hardware
on Arm SoCs that could run the same kernel.

I very much hope we can merge this bit.

       Arnd
