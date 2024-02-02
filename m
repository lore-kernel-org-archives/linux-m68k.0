Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC44DDCE
	for <linux-m68k@vger.kernel.org>; Fri,  2 Feb 2024 03:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.218
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706846241; cv=pass; b=qqvcW3gW9VA8nMncz16CSuiUyODPm1TNy9Rqkk/taCjRvXStsttJq1wvZwqcQvSBiuDfBhOtC6wX7/X1rAthcbpG5Pa2ZffzUL8AMJd/kCQKIX81JI19VAsYGfgNEB/1sTckXxGvY8MDeex8yjCUbJUdKpxl6+jXmXaR9XVsJso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706846241; c=relaxed/simple;
	bh=OWaUsxOIX3jeZ6R00Rn+O5MBJrxjyl8s6XJMdI/TTBY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=XLokRro0wyUtvCcz47zZdCO9MKh2EfN42DIdty8eAd0FIZAaJJ9gr2Pl4t4zUN139Xon6nQSkZNZe/wE/uIVpVLQXXYoo7uiKE7Xds3kRK8GYNa3OJSfhpeonvHDKY/NnQm1E+8iZjTAvJhRkVAaDeV6qcnXd/3S7/HNsnDiwFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fpond.eu; spf=none smtp.mailfrom=fpond.eu; dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=MGXn0lgP; dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=Pmslkuza; arc=pass smtp.client-ip=81.169.146.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fpond.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fpond.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="MGXn0lgP";
	dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="Pmslkuza"
ARC-Seal: i=1; a=rsa-sha256; t=1706846054; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=dkDhAKxm4dsS8hRAsXbJVllQKTTwYEQskQXa/M5czgRu2PQfEOlbDifLGREpdqj9P3
    fqZtVVknCJRPYUzGuncxuwCdwILNki+0/V/TKGzDAueMc2i+ZzSQmQKnLWVK22CPCciN
    RvdysR6e80e2sjXQ4bzP036WZ+uavtcEeW1pIqta5zOA/4ZH+jn5oy03dlv0GjeKpdGT
    0T7wncPjrRorWkbxGzo71r3IGaMv0S+lPX4dPaqHShiHHMAcuQewExw0zdSB6NPraXuX
    lZj8lRHS48t0rCqCuVg37x2906d625eclrDPsn8MLIXaAYhdnzDqLGjrgl6dUxSwNG3/
    7AjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1706846054;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=D1PJ33Al58Oj79FC4LzOHfCJIx91hqZZs9eizfDW+Tc=;
    b=OGKti5ldY9GOtc0joGPMCWGVdoU1WCNHVKIdxwG0T2VGeHlV14JaH5avZRdoAdYa4z
    ot3M71VIUn7slqm5Tj+xZUWLAdLu4kzdFlpedmLzfMtFRosR+kjExGX7XCL88hZmOQ/Q
    Ktw8w5nz4EVEkGbM40zaxSWwH4SKMVTIY9DdwIYqDrLmvYzMYMDs+bT6389a2q+wpNqr
    gd4/S3sMki+HZnZQBtvm/ffyi3GKs54ZIPhbJKPePru/Rlhl0KMcrRNlW7dVbujxQft9
    66pEfjAoKRecsk0mefdAC4K8yX3STX8Z3U0BytY+ZQ17bZ0pP4svfpr6xzHhlQKXymIe
    LBkQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1706846054;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=D1PJ33Al58Oj79FC4LzOHfCJIx91hqZZs9eizfDW+Tc=;
    b=MGXn0lgPjFT8VwA7hvP/naJaSF5iQtd4hp4+GgHbdT7Zp++nFPcadV3rTeGx8Q1vNF
    tCvqw2IB1NyJ3sBB64Ud0Utz/99pTz3U2lUsgQqAD8ofVDvpQJvpIAxNMYNgaLwq/nCe
    uhX/lXpf536Vwp4JLBd747EQWC5AGfoWEqefpSjDaSeEg4hlOrkEymeglfuIIb2PTFBn
    IEWm2ZeOMJcIUeRgr7jelyLwZ9kdH22AtO7fhOGVt7clQOXa/deV8E+RJ2tnm16X0Pnn
    PZYEIUhwumOY5/yt8MXo+hT3qddxSNvcVxLpqWwv0x9b4wnbQPGQnnTbo3N6PTPqqqbJ
    blEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1706846054;
    s=strato-dkim-0003; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=D1PJ33Al58Oj79FC4LzOHfCJIx91hqZZs9eizfDW+Tc=;
    b=PmslkuzaYxuzdgFqakDQGo0bsYhSw+zGCSslpsedUj+daNodSt0MZsOgyj6EYts8rf
    4O+qvxsd2k5OgcW2KjCA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGl/wuMlg=="
Received: from ox-live-app101.back.ox.d0m.de
    by smtp-ox.front (RZmta 49.11.2 AUTH)
    with ESMTPSA id Z7ddde0123sEXS4
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 2 Feb 2024 04:54:14 +0100 (CET)
Date: Fri, 2 Feb 2024 04:54:14 +0100 (CET)
From: Ulrich Hecht <uli@fpond.eu>
To: cip-dev@lists.cip-project.org, Michael Schmitz <schmitzmic@gmail.com>,
	linux-m68k@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <1550495460.64761.1706846054273@webmail.strato.com>
In-Reply-To: <20240201204329.24202-1-schmitzmic@gmail.com>
References: <20240201204329.24202-1-schmitzmic@gmail.com>
Subject: Re: [cip-dev] [PATCH] m68k: include module.h to make use of
 exception handling in traps.c
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev57
X-Originating-Client: open-xchange-appsuite


> On 02/01/2024 9:43 PM CET Michael Schmitz <schmitzmic@gmail.com> wrote:
> 
>  
> Backporting commit 513138a14063760e (m68k: Only force 030
> bus error if PC not in exception table) to v4.4 by the CIP
> project revealed a build error due to extable.h not yet
> available.
> 
> extable.h was split off module.h in v4.8 (commit
> 0ef7653797addea8) so amend 513138a14063760e accordingly.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401302324.d3o6tgup-lkp@intel.com/
> Cc: <cip-dev@lists.cip-project.org> # 4.4
> Cc: Ulrich Hecht <uli@fpond.eu>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> ---
>  arch/m68k/kernel/traps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
> index c547140b8325..2209214cf91c 100644
> --- a/arch/m68k/kernel/traps.c
> +++ b/arch/m68k/kernel/traps.c
> @@ -29,7 +29,7 @@
>  #include <linux/init.h>
>  #include <linux/ptrace.h>
>  #include <linux/kallsyms.h>
> -#include <linux/extable.h>
> +#include <linux/module.h>
>  
>  #include <asm/setup.h>
>  #include <asm/fpu.h>
> -- 
> 2.17.1

Applied, thank you.

CU
Uli
