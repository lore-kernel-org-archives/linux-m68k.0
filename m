Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875CF42A93
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Feb 2025 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739953401; cv=none; b=AtVtx88zaM/l6ed8iKpXGJET0//ryN2DXZgqwIihxwu8wXQizJHyysRmxXEvQ1KGa4l0jGnZLnOIZUsxxkS+JlPhs5KlJGj+4oOr8qxyPS1BlOZaMUaJdwlC2X6gRg6R+IToI5z2EELWm2RHjENYgTGttVRt/T8TpUy2a9Rv8aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739953401; c=relaxed/simple;
	bh=5FPHiush55MszifsbsCqKXtpfzM7+rU78cFBHQxBxro=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KSANATAW4A3nXbDQfb6jvSZRz3yODxjyxcRYKAy789Vq72jpfNeDMgvF6tkdkao7uD/1Ixjs6g9C/VZld0hQya9cr6XaAJbnVEzbx+nO9oROJi/y2P+ofJaP49L/TXTJt8DhDkgvfWUZSyl8In9kaFaGNxAn3Rvr/jd6qcsibpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 180BB5C43FA
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Feb 2025 08:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E60C4CED1;
	Wed, 19 Feb 2025 08:23:15 +0000 (UTC)
Message-ID: <f509221c-1b56-4c43-8f60-86c419bc9c4d@linux-m68k.org>
Date: Wed, 19 Feb 2025 18:23:12 +1000
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
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <a98f49e8-3e42-432d-8614-d9b217974a2c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 19/2/25 17:06, Krzysztof Kozlowski wrote:
> On 18/02/2025 13:46, Greg Ungerer wrote:
>> Add a simple devicetree to support the Freescale MCF5475-EVB platform.
>>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
>> ---
>>   arch/m68k/boot/dts/Makefile       |  1 +
>>   arch/m68k/boot/dts/mcf5475evb.dts | 55 +++++++++++++++++++++++++++++++
>>   2 files changed, 56 insertions(+)
>>   create mode 100644 arch/m68k/boot/dts/mcf5475evb.dts
>>
>> diff --git a/arch/m68k/boot/dts/Makefile b/arch/m68k/boot/dts/Makefile
>> index d69e37b48558..f0e9643e6b71 100644
>> --- a/arch/m68k/boot/dts/Makefile
>> +++ b/arch/m68k/boot/dts/Makefile
>> @@ -1,4 +1,5 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   
>>   dtb-y += mcf5208evb.dtb
>> +dtb-y += mcf5475evb.dtb
>>   
>> diff --git a/arch/m68k/boot/dts/mcf5475evb.dts b/arch/m68k/boot/dts/mcf5475evb.dts
>> new file mode 100644
>> index 000000000000..247a938bfafd
>> --- /dev/null
>> +++ b/arch/m68k/boot/dts/mcf5475evb.dts
>> @@ -0,0 +1,55 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/dts-v1/;
>> +
>> +/ {
>> +	model = "Freescale MCF5475EVB";
>> +	compatible = "mcf5475evb";
> 
> Incorrect format.
> 
> Please run scripts/checkpatch.pl and fix reported warnings. After that,
> run also `scripts/checkpatch.pl --strict` and (probably) fix more
> warnings. Some warnings can be ignored, especially from --strict run,
> but the code here looks like it needs a fix. Feel free to get in touch
> if the warning is not clear.

If that is an incorrect format then checkpatch is not reporting it.

Checkpatch here (even --strict) only reports that it is undocumented:

     WARNING: DT compatible string "mcf5475evb" appears un-documented -- check ./Documentation/devicetree/bindings/
     #36: FILE: arch/m68k/boot/dts/mcf5475evb.dts:6:
     +	compatible = "mcf5475evb";

Which I totally expect at this point. As pointed out in the cover letter this
work is very much an incomplete proof-of-concept still. Much work still to do here.


>> +	#address-cells = <1>;
>> +	#size-cells = <1>;
>> +	interrupt-parent = <&intc>;
>> +
>> +	coreclk: clock-266000000 {
>> +		#clock-cells = <0>;
>> +		compatible = "fixed-clock";
>> +		clock-frequency = <266000000>;
>> +	};
>> +
>> +	intc: interrupt-controller@ff000700 {
>> +		compatible = "fsl,intc-2";
>> +		interrupt-controller;
>> +		#interrupt-cells = <1>;
>> +		reg = <0xff000700 0x80>;
>> +	};
>> +
>> +	uart0: serial@ff008600 {
>> +		compatible = "fsl,mcfuart";
>> +		reg = <0xff008600 0x80>;
>> +		interrupts = <99>;
>> +		clocks = <&coreclk>;
>> +		status = "okay";
> 
> Did you disable it anywhere?

No.

Regards
Greg

