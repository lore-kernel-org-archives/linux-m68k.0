Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0AC1EEA54
	for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Jun 2026 00:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782521124; cv=none; b=Evjye07gzUu4e6gIFItbNrnTaKdZLxox2sln1BdMZ2AWrrc97vf7CmLaogmWK/mpwyYLGBKrWYvw36SFdBn0gYNNnVWhvOxCyPId2pbLGBcjrDW+67myZjRkB3KnVEGbZtmtE+/r2CGl4rXHGTnPu8xwNq4hoSxMvk8+KoBJs6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782521124; c=relaxed/simple;
	bh=kcCoudtrYsi9IUF09xctIw4mLA0D1BJn13vGl73pscA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pqr/z+TliblL2HJhb5qSmVAk/fE5+/01M2/M2TN1K2faT4G2xliSWeszifRRm9aIzffi7IPSukplH/U1ysmTe2wSU1gLLAXclE2vwNoDTMnwbjNNJiZlloyOGv7TvZe7cWd2smrwRD9n8tFS6ki618+rr7Om0DrhGXmP2Qetbj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MVd2/gzA; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MVd2/gzA"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6479A7A0116;
	Fri, 26 Jun 2026 20:45:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 26 Jun 2026 20:45:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782521121; x=1782607521; bh=WGww39iwULt6ZlD/7NofSFXvCzUOG8tos9N
	qKW1CsYA=; b=MVd2/gzAN36C5ckEbTddg0pQRrFpmUwYmujCDPdVvCmceKD2uTS
	o9kQ0iesmdxH16EHReyRyxNc31cImVyolIvALcGnuD99OXLJXo2qehIDm/WXwsX5
	I6ud1vGqPbbDdLMacodYeFQfol3GLkxgxm0V+CE3sAawy61lgiJp91Q+lawOWyK4
	Mm/+GnbowkMBzWSwcQN4FtxVpYit76z7UiZWX15iAAxoeLEuYMkeZB80f9Eo202s
	5aiWH5dpqJyjVDUKrtchKzXNWTTv0STxpPCSunpyIEEUJTfFeiCx5e+Z/IDV64og
	Vp3Da9OsN/ot3YKWfYG00RZqqOd9uqaxP+g==
X-ME-Sender: <xms:IB0_aiTR0yt4cpYUJfEwKcQjmzCJ2k2KF2OCq0yHsxc4-4Jj7dbAPQ>
    <xme:IB0_avjnEOUtnKzdQLpJrhkvBXYUtKAtS74a_MYOy0UhPGEN2XW8Ekwrsg44nXHh1
    pZ_Z32kBai9ufuVRETRafwUEN2On-gAzX9HT-OY1F6MJJHq646RSh_O>
X-ME-Received: <xmr:IB0_ai4QnQsHky_E9ATZfVH1i3TyKDEh3--uHC8MXnQwV5VYEvDpdInvGMaRv2X1ovqYNW53cR3or4qmS9TM6emC1oG9vhsLw7w>
X-ME-Proxy-Cause: dmFkZTE5/9u51qarr5EcoODav0NajgqjJQKYnKAMQtEPG2/U3ExtJMDsrRIp/7SovmULle
    R9ttFwJEtZ+7eDQb5vqieXj3dYS3gSVBR7w/2UhIbzKH6ifsgtAJThdDzTd116i2wly6L4
    pNUas4kF7ISQ+7OmrrfAjEOolcxiRfHqGjaCwzcZx4T6tO4fyknByyfoDnyVNMbV4hQWg4
    D70LoeRoNT1/rQ/WcL+NdTxDak8k7nTtQGB9aaHe2x/fqf7Aaik7Hr+MZhAmdrTARIOrM0
    LZwUJNSsPTQ5x2CqgKO0wyzUL7waVY+gL9AsUEoK4nvD4Ml4z4w9RWCeLAaeWRmu/81JhQ
    4nApxrTMDafDetPxhWMD9PPAdNsTiypCEyBDcI0dRFnHK8I0YLIpK/vE3T+YCeS1gaWiyn
    7+n6NCEdcg4xykDOsGK9G5qPkAUBFxkuhr2j890Xkr3bV7gnm7+pbOmqlwDrEwQ/1wpJMp
    pfJ9HJ+VFllVNpvblsfiBtwAja/5hQ44dYVDIQcxhvygaqTQ2ibkaYZ0rPLHgen9wrojlB
    R3PeOI3TqSSKklRE/LUB7aJXNxvixLi0jGtBxMbOHfaEkGSnFLOQTFwsLRZMYwdfH8aW79
    wH4PfaWxKKj6ph1ir8hekzPYh3lwDZ1+Qq8ztm30OVWJYO+gp32DvVR/Rodw
X-ME-Proxy: <xmx:IB0_asC4YuexpT8luJDXCvIEPB46g3R1vMH6svjZu1BIT-WTkZ575w>
    <xmx:IB0_apYz2HUXPLK_IYYtz02lMXs8H5q1VxH-deUYjS3yTqoQIa9gWA>
    <xmx:IB0_anZ73XDzFUehz4jl-Mxu-m8OvYQ9zUefpBiMoukb60ZUmejB7Q>
    <xmx:IB0_ag-j650m1mnvKo1LNYaETgUyWtdD_s1pQcNCedsurzHQ-8-RCg>
    <xmx:IR0_apN95MQbuYY0GjyGFn5BVK-SGQ8Z1VBhAmQ88wdgI8Y5IumNtEX3>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Jun 2026 20:45:17 -0400 (EDT)
Date: Sat, 27 Jun 2026 10:45:22 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Daniel Palmer <daniel@thingy.jp>
cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: m68k: 68000 port for megadrive
In-Reply-To: <CAFr9PXnh7cxzLYpkxXDx9UVrxZmywmbByU386XdijAtVKECzXg@mail.gmail.com>
Message-ID: <8c8fc514-0a95-e25d-9af5-c9329134b11f@linux-m68k.org>
References: <CAFr9PXnh7cxzLYpkxXDx9UVrxZmywmbByU386XdijAtVKECzXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Fri, 26 Jun 2026, Daniel Palmer wrote:

> I'm not going to send patches* for this but I thought it'd at least be
> funny to someone.

Not funny to me. I think it's valuable work.

> I've used my DeviceTree enabled version of the 68000 code to do a
> quick port to the megadrive.
> 
> https://github.com/LinuxMD/linuxmd (screenshot is near the end)
> 

...

> Calibrating delay loop... 0.72 BogoMIPS (lpj=5984)

...

> Memory: 2532K/4096K available (1002K kernel code, 54K rwdata, 108K rodata, 
> 72K init, 39K bss, 1368K reserved, 0K cma-reserved)


My old laptop has about 1000x the bogomips and 1000x the memory shown in 
your console log. Your work shows me what 1000 virtual machines might look 
like here.

Shrinking the operating system in that way (no block layer, no network 
stack etc.) is important work and is a real step towards comfortably 
hosting a million busy containers on a single system.
