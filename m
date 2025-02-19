Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21411C5D4B
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Feb 2025 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739953607; cv=none; b=cc6CfVWpBe3XBTbfITPfzwQKjzlwEtWDQYJDVUqcT8qD1+LQ7+XJRBfoQEuf7b9u6plqSiy+F20lEHoins0IeOXYbG424D8j0svOKJ80RP7RpVNyImG7auEkfEXbo/OOHnKOM1K7jTnwenBipGYF2IV+SuMsMaXZ12VtlIB9rjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739953607; c=relaxed/simple;
	bh=8BrzsTbWki0pVK/Ckj1ot/ZA/dLgl8OvjS1DGcV3o+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lnYeGEBRJH3gCBHIS6RHt3rdQW4m6PDNktZGMiGuRfX1oJkUTnsDpXGfcqftRNlab5SFFwMTACc504/VuDcdfXARolrHhQdYoJp5lZ0TsRsy5Vu5Y1AzbAw5N2KxjkxGzv33LZp5h04KFMfPUAPXTdlPW3X/Aoengkh34QHueTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fu8hvRW9; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fu8hvRW9"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD9505C57E8;
	Wed, 19 Feb 2025 08:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A543C4CEE6;
	Wed, 19 Feb 2025 08:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739953600;
	bh=8BrzsTbWki0pVK/Ckj1ot/ZA/dLgl8OvjS1DGcV3o+w=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Fu8hvRW90XugJNHSYfARNul9eNkCbKJfPWsOMiM2q4qez+ItEnLMhcI7wuAzuhbLD
	 WcC73uEv+1fwMS3YrtW3XtTJcI20kDn71XJecjkhBUbkptipAic4wXOcU6Pm84UcA8
	 JBiXC/G1O6NOrTxamiFESjHKzRHeKuQbCQrceJNR7yosjadV55KWu/hw91+IHYeqCj
	 AUflqcBqILQhuyWMgjhkQiqRO9H5J5V35ENlmoPyc8eVzu6XIf4UGG4wa7bXfXWPYI
	 V0Yz+jv5YD+/wsdOFVBJNu+1t77JGnlUn/NRdUyzTAzs3Oe//vQbVl+RzkL4E3wjbO
	 H+qPTkdLWwLmw==
Message-ID: <4155980d-cee8-4d60-8ca2-51be1d351282@kernel.org>
Date: Wed, 19 Feb 2025 09:26:37 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] m68k: coldfire: add devicetree for mcf5475-evb
 platform
To: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
References: <20250218125124.2692982-1-gerg@linux-m68k.org>
 <20250218125124.2692982-10-gerg@linux-m68k.org>
 <a98f49e8-3e42-432d-8614-d9b217974a2c@kernel.org>
 <f509221c-1b56-4c43-8f60-86c419bc9c4d@linux-m68k.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <f509221c-1b56-4c43-8f60-86c419bc9c4d@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/02/2025 09:23, Greg Ungerer wrote:
> Hi Krzysztof,
> 
> On 19/2/25 17:06, Krzysztof Kozlowski wrote:
>> On 18/02/2025 13:46, Greg Ungerer wrote:
>>> Add a simple devicetree to support the Freescale MCF5475-EVB platform.
>>>
>>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
>>> ---
>>>   arch/m68k/boot/dts/Makefile       |  1 +
>>>   arch/m68k/boot/dts/mcf5475evb.dts | 55 +++++++++++++++++++++++++++++++
>>>   2 files changed, 56 insertions(+)
>>>   create mode 100644 arch/m68k/boot/dts/mcf5475evb.dts
>>>
>>> diff --git a/arch/m68k/boot/dts/Makefile b/arch/m68k/boot/dts/Makefile
>>> index d69e37b48558..f0e9643e6b71 100644
>>> --- a/arch/m68k/boot/dts/Makefile
>>> +++ b/arch/m68k/boot/dts/Makefile
>>> @@ -1,4 +1,5 @@
>>>   # SPDX-License-Identifier: GPL-2.0
>>>   
>>>   dtb-y += mcf5208evb.dtb
>>> +dtb-y += mcf5475evb.dtb
>>>   
>>> diff --git a/arch/m68k/boot/dts/mcf5475evb.dts b/arch/m68k/boot/dts/mcf5475evb.dts
>>> new file mode 100644
>>> index 000000000000..247a938bfafd
>>> --- /dev/null
>>> +++ b/arch/m68k/boot/dts/mcf5475evb.dts
>>> @@ -0,0 +1,55 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/dts-v1/;
>>> +
>>> +/ {
>>> +	model = "Freescale MCF5475EVB";
>>> +	compatible = "mcf5475evb";
>>
>> Incorrect format.
>>
>> Please run scripts/checkpatch.pl and fix reported warnings. After that,
>> run also `scripts/checkpatch.pl --strict` and (probably) fix more
>> warnings. Some warnings can be ignored, especially from --strict run,
>> but the code here looks like it needs a fix. Feel free to get in touch
>> if the warning is not clear.
> 
> If that is an incorrect format then checkpatch is not reporting it.

There are two issues here.
1. Incorrect format: see DT spec or any other example.
2. Below checkpatch warning.

> 
> Checkpatch here (even --strict) only reports that it is undocumented:
> 
>      WARNING: DT compatible string "mcf5475evb" appears un-documented -- check ./Documentation/devicetree/bindings/
>      #36: FILE: arch/m68k/boot/dts/mcf5475evb.dts:6:
>      +	compatible = "mcf5475evb";
> 
> Which I totally expect at this point. As pointed out in the cover letter this
> work is very much an incomplete proof-of-concept still. Much work still to do here.


Patch should be marked as RFC with that explanation in cover letter, so
you won't get such review comments.

>>> +	#address-cells = <1>;
>>> +	#size-cells = <1>;
>>> +	interrupt-parent = <&intc>;
>>> +
>>> +	coreclk: clock-266000000 {
>>> +		#clock-cells = <0>;
>>> +		compatible = "fixed-clock";
>>> +		clock-frequency = <266000000>;
>>> +	};
>>> +
>>> +	intc: interrupt-controller@ff000700 {
>>> +		compatible = "fsl,intc-2";
>>> +		interrupt-controller;
>>> +		#interrupt-cells = <1>;
>>> +		reg = <0xff000700 0x80>;
>>> +	};
>>> +
>>> +	uart0: serial@ff008600 {
>>> +		compatible = "fsl,mcfuart";
>>> +		reg = <0xff008600 0x80>;
>>> +		interrupts = <99>;
>>> +		clocks = <&coreclk>;
>>> +		status = "okay";
>>
>> Did you disable it anywhere?
> 
> No.


So no need for that status.

Best regards,
Krzysztof
