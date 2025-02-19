Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6832580E2
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Feb 2025 21:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740002336; cv=none; b=MzyK00XcVUjaSTLehU/V0wORbcxPuQF0roGCApEScpIG/4Jny8tqLrGvVeQll8YMRYkqRVGB0LYgHOBsj26xuC7pepeiVxddjTKCmC5PGctUDKl+TAktr403YEKcsku+yR3nhGu+vBJf1ZO7NlgHRrDRu84sgCp4X8NyIXFV6GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740002336; c=relaxed/simple;
	bh=CLbMtW5tsKEFh2zuG4iubeHLHmyTYeg3kVyBTjMQ9M8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OqTOxfR8Bmv+wTTQj92JPkZq3DcTYbZ4Z6l08edWXS+N/30Tug9NuxbCMzQmi1VPWg2xT4yXdL3k098eaXdBvTzkAB6+14QxiWzKFG5AWy2g6RTuLGCN5zHi1z/orYjXx3cXxL6a7el9GkjUzKQ33LXJ4sr3zgAHdRSfD+OgZis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D608611EC
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Feb 2025 21:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E11C4CED1;
	Wed, 19 Feb 2025 21:58:51 +0000 (UTC)
Message-ID: <21d14a49-2c82-4c97-b78e-1761f29f24f7@linux-m68k.org>
Date: Thu, 20 Feb 2025 07:58:49 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] m68k: coldfire: add devicetree for mcf5475-evb
 platform
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-m68k@lists.linux-m68k.org
References: <20250218125124.2692982-1-gerg@linux-m68k.org>
 <20250218125124.2692982-10-gerg@linux-m68k.org>
 <a98f49e8-3e42-432d-8614-d9b217974a2c@kernel.org>
 <f509221c-1b56-4c43-8f60-86c419bc9c4d@linux-m68k.org>
 <4155980d-cee8-4d60-8ca2-51be1d351282@kernel.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <4155980d-cee8-4d60-8ca2-51be1d351282@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 19/2/25 18:26, Krzysztof Kozlowski wrote:
> On 19/02/2025 09:23, Greg Ungerer wrote:
>> Hi Krzysztof,
>>
>> On 19/2/25 17:06, Krzysztof Kozlowski wrote:
>>> On 18/02/2025 13:46, Greg Ungerer wrote:
>>>> Add a simple devicetree to support the Freescale MCF5475-EVB platform.
>>>>
>>>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
>>>> ---
>>>>    arch/m68k/boot/dts/Makefile       |  1 +
>>>>    arch/m68k/boot/dts/mcf5475evb.dts | 55 +++++++++++++++++++++++++++++++
>>>>    2 files changed, 56 insertions(+)
>>>>    create mode 100644 arch/m68k/boot/dts/mcf5475evb.dts
>>>>
>>>> diff --git a/arch/m68k/boot/dts/Makefile b/arch/m68k/boot/dts/Makefile
>>>> index d69e37b48558..f0e9643e6b71 100644
>>>> --- a/arch/m68k/boot/dts/Makefile
>>>> +++ b/arch/m68k/boot/dts/Makefile
>>>> @@ -1,4 +1,5 @@
>>>>    # SPDX-License-Identifier: GPL-2.0
>>>>    
>>>>    dtb-y += mcf5208evb.dtb
>>>> +dtb-y += mcf5475evb.dtb
>>>>    
>>>> diff --git a/arch/m68k/boot/dts/mcf5475evb.dts b/arch/m68k/boot/dts/mcf5475evb.dts
>>>> new file mode 100644
>>>> index 000000000000..247a938bfafd
>>>> --- /dev/null
>>>> +++ b/arch/m68k/boot/dts/mcf5475evb.dts
>>>> @@ -0,0 +1,55 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/dts-v1/;
>>>> +
>>>> +/ {
>>>> +	model = "Freescale MCF5475EVB";
>>>> +	compatible = "mcf5475evb";
>>>
>>> Incorrect format.
>>>
>>> Please run scripts/checkpatch.pl and fix reported warnings. After that,
>>> run also `scripts/checkpatch.pl --strict` and (probably) fix more
>>> warnings. Some warnings can be ignored, especially from --strict run,
>>> but the code here looks like it needs a fix. Feel free to get in touch
>>> if the warning is not clear.
>>
>> If that is an incorrect format then checkpatch is not reporting it.
> 
> There are two issues here.
> 1. Incorrect format: see DT spec or any other example.
> 2. Below checkpatch warning.

Fixed in next version.

Thanks
Greg


>>
>> Checkpatch here (even --strict) only reports that it is undocumented:
>>
>>       WARNING: DT compatible string "mcf5475evb" appears un-documented -- check ./Documentation/devicetree/bindings/
>>       #36: FILE: arch/m68k/boot/dts/mcf5475evb.dts:6:
>>       +	compatible = "mcf5475evb";
>>
>> Which I totally expect at this point. As pointed out in the cover letter this
>> work is very much an incomplete proof-of-concept still. Much work still to do here.
> 
> 
> Patch should be marked as RFC with that explanation in cover letter, so
> you won't get such review comments.
> 
>>>> +	#address-cells = <1>;
>>>> +	#size-cells = <1>;
>>>> +	interrupt-parent = <&intc>;
>>>> +
>>>> +	coreclk: clock-266000000 {
>>>> +		#clock-cells = <0>;
>>>> +		compatible = "fixed-clock";
>>>> +		clock-frequency = <266000000>;
>>>> +	};
>>>> +
>>>> +	intc: interrupt-controller@ff000700 {
>>>> +		compatible = "fsl,intc-2";
>>>> +		interrupt-controller;
>>>> +		#interrupt-cells = <1>;
>>>> +		reg = <0xff000700 0x80>;
>>>> +	};
>>>> +
>>>> +	uart0: serial@ff008600 {
>>>> +		compatible = "fsl,mcfuart";
>>>> +		reg = <0xff008600 0x80>;
>>>> +		interrupts = <99>;
>>>> +		clocks = <&coreclk>;
>>>> +		status = "okay";
>>>
>>> Did you disable it anywhere?
>>
>> No.
> 
> 
> So no need for that status.
> 
> Best regards,
> Krzysztof

