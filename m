Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D3E502AD
	for <linux-m68k@lists.linux-m68k.org>; Tue, 28 May 2024 06:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716877971; cv=none; b=eWqqF152roNem5MntSC3Ua4W3P+/dGzO7azXsglsbsjeGOjuew0A4R3xnRMNDJgri9iPsmmtu5U7bBijObhbp8tvtnq+T+wSCifIyeKIBIrWXOWPDG0/2RNxqW/DS8KEzskpnMrpV9rhDm4ZDy+TDQVxiIswzRwrcbD8h0K6DAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716877971; c=relaxed/simple;
	bh=BN52AwW9cF1XOrgCc4YES+FNZFniSZm7bUauT/QNN94=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Te+YHZ3eErl7ydFH16dyF8F0nTpCaOB74+xNazkAG0CJ/rCBzIm/NI6mGevA7g9gQjxDTxhehP75GK8NTwGlpvl8xrAeRVz2rNfXL97U8Y7QqgwlgKZgFaNOBeqdvoC5V59yh0wPiK4dPTBZ3iKjC4juCDrWzEP5ST6e+3Mv94A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=dNaerC/c; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="dNaerC/c"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09D4460004;
	Tue, 28 May 2024 06:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1716877966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ck9entwquckmt0twK7O06nv6RO6sIFOdTBAAJYfVHiM=;
	b=dNaerC/cLHfdevyPjQnU0urt8pFf/l9AeMjQWtFm6b4vh6NghLl0neB+mMDmhUY2DvoI7b
	1TszD+St1sHlyVvyzKxqDoPMCSWzeOoX6IqEp61cmwq1Y6R6hGR9+csIDDaR//ay6dj8K6
	bRKQF5fNKDiVBZ8QTMTwKrMQ+kmOJQH8UA1ZHas1Qis20AZwiSHr91ZsDi4keUnwuF1E0T
	NttWpD/KJm0kVdeirrhND3JTUm0rhO0zd/ALbXoqzxk7yb9weQnUKaXT7R8JVjLKg2SLEe
	uyWyCnHO1ql7wWdovjW2sSatQ3XHzjHWr13SUUD0S3/LAL082EvxPqsQc1DFYg==
Message-ID: <fa1cb665-965d-4215-bb28-82b629156d83@yoseli.org>
Date: Tue, 28 May 2024 08:32:45 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel Image Format Issue - Coldfire mcf54418 CPU Failing to Boot
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: Greg Ungerer <gerg@linux-m68k.org>, Michael Schmitz
 <schmitzmic@gmail.com>, linux-m68k@lists.linux-m68k.org
Cc: geert@linux-m68k.org
References: <68ec857f-a559-4f71-87ba-425b4ee7c9c7@yoseli.org>
 <d18dab84-f6d8-4732-88cb-8b95bd4487f3@gmail.com>
 <45745b6a-341c-4f9c-8787-6154393d1223@yoseli.org>
 <d94c6e57-58d4-4299-a23e-013a3cb13997@linux-m68k.org>
 <f316b64e-c696-478d-8383-5d18c96e6c11@yoseli.org>
 <106876d4-a93f-433f-848d-da85ab84bd14@linux-m68k.org>
 <6376845d-e741-4117-bfd3-81860ba08399@yoseli.org>
 <9cd36f99-f4d3-44bb-ab22-e1e497906048@linux-m68k.org>
 <6120cdb4-4666-418f-8d2d-5b0e72662e3e@yoseli.org>
Content-Language: en-US
In-Reply-To: <6120cdb4-4666-418f-8d2d-5b0e72662e3e@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Greg, all,

On 27/05/2024 15:19, Jean-Michel Hautbois wrote:
> Hello Greg,
> 
> On 21/05/2024 15:46, Greg Ungerer wrote:
>> Hi Jean-Michel,
>>
>> On 16/5/24 23:31, Jean-Michel Hautbois wrote:
>>> On 16/05/2024 14:43, Greg Ungerer wrote:
>>>> On 15/5/24 21:10, Jean-Michel Hautbois wrote:
>>>>> On 15/05/2024 12:29, Greg Ungerer wrote:
>>>>>> On 15/5/24 17:56, Jean-Michel Hautbois wrote:
>>>>>>> On 14/05/2024 22:16, Michael Schmitz wrote:
>>>>>>>> 'BIV' is probably a bootinfo tag (Boot Info Version).
>>>>>>>
>>>>>>> Thanks, it helped me, as I read the head.S file and finally 
>>>>>>> progressed :-).
>>>>>>>
>>>>>>> When dumping my vmlinux, I can see the entry point is *not* the 
>>>>>>> load address (it was in the old one):
>>>>>>> vmlinux:     file format elf32-m68k
>>>>>>>
>>>>>>>
>>>>>>> Disassembly of section .text:
>>>>>>>
>>>>>>> 40001000 <_stext>:
>>>>>>> 40001000:    4ef9 4000 2000     jmp 40002000 <_start>
>>>>>>>      ...
>>>>>>>
>>>>>>> 40002000 <_start>:
>>>>>>> 40002000:    4e71               nop
>>>>>>> 40002002:    46fc 2700          movew #9984,%sr
>>>>>>> 40002006:    203c 0104 0100     movel #17039616,%d0
>>>>>>> 4000200c:    4e7b 0002          movec %d0,%cacr
>>>>>>> 40002010:    4e71               nop
>>>>>>>
>>>>>>> Now, when uboot starts the kernel, it is not doing anything (not 
>>>>>>> sure if it hangs or does not display anything on the console. And 
>>>>>>> EARLY_PRINTK is not valid for coldfire :-(. Not sure why, so any 
>>>>>>> guidance here would be appreciate too !
>>>>>>>
>>>>>>> I will now check my platform file but at least I am not trying to 
>>>>>>> execute an instruction "0" :-).
>>>>>>
>>>>>> Can you post your kernel .conig file?
>>>>>> Did you just start with your original 3.0.12 config and use that 
>>>>>> for 6.1.83?
>>>>>
>>>>> No, I used a very simplified one to start.
>>>>>
>>>>> CONFIG_NAMESPACES=y
>>>>> CONFIG_EMBEDDED=y
>>>>> CONFIG_COLDFIRE=y
>>>>> CONFIG_M5441x=y
>>>>> CONFIG_ADVANCED=y
>>>>> # CONFIG_SINGLE_MEMORY_CHUNK is not set
>>>>> CONFIG_CLOCK_FREQ=240000000
>>>>> CONFIG_STMARK2=y
>>>>> CONFIG_UBOOT=y
>>>>> CONFIG_RAMBASE=0x40000000
>>>>> CONFIG_RAMSIZE=0x8000000
>>>>> CONFIG_VECTORBASE=0x40000000
>>>>> CONFIG_KERNELBASE=0x40001000
>>>>> CONFIG_BINFMT_FLAT=y
>>>>> CONFIG_NET=y
>>>>> CONFIG_PACKET=y
>>>>> CONFIG_UNIX=y
>>>>> CONFIG_INET=y
>>>>> CONFIG_DEVTMPFS=y
>>>>> CONFIG_DEVTMPFS_MOUNT=y
>>>>> CONFIG_NETDEVICES=y
>>>>> CONFIG_SERIAL_MCF=y
>>>>> CONFIG_SERIAL_MCF_BAUDRATE=115200
>>>>> CONFIG_SERIAL_MCF_CONSOLE=y
>>>>> CONFIG_HID_A4TECH=y
>>>>> CONFIG_HID_BELKIN=y
>>>>> CONFIG_HID_CHERRY=y
>>>>> CONFIG_HID_CYPRESS=y
>>>>> CONFIG_HID_EZKEY=y
>>>>> CONFIG_HID_ITE=y
>>>>> CONFIG_HID_KENSINGTON=y
>>>>> CONFIG_HID_REDRAGON=y
>>>>> CONFIG_HID_MICROSOFT=y
>>>>> CONFIG_HID_MONTEREY=y
>>>>> CONFIG_VMLINUX_MAP=y
>>>>> CONFIG_DEBUG_MEMORY_INIT=y
>>>>> CONFIG_BOOTPARAM=y
>>>>> CONFIG_BOOTPARAM_STRING="console=ttyS1,115200"
>>>>>
>>>>> My serial console is on UART6, so I suppose I will have to modify 
>>>>> the MCFGPIO_PAR_UART2 register in arch/m68k/coldfire/m5441x.c at 
>>>>> the very least.
>>>>
>>>> Was the older 3.0.12 code base a mainline kernel, or is it a 
>>>> modified vendor version?
>>>
>>> The kernel came from the Tower system module and it has been adapted 
>>> to the custom board. I suppose (but it was a long time ago and not me 
>>> ;-)) that it was a downstream kernel.
>>>
>>> https://www.nxp.com/products/no-longer-manufactured/coldfire-mcf5441x-tower-system-module:TWR-MCF5441X
>>
>>
>> It is probably more likely that it used Freescales own development 
>> package
>> (LTIB, or maybe something newer). It was most likely their own 
>> modified kernel
>> sources, so probably not strictly a mainline kernel.
>>
>>
>>> Right now, when load addr is set to 0x40001000 and entry addr is set 
>>> to 0x40002000 the 6.1 seems to start but nothing is going on my console.
>>>
>>> I added a local patch for my uart to be set, but still nothing yet:
>>> diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
>>> index 1e5259a652d1..1bcabef82851 100644
>>> --- a/arch/m68k/coldfire/m5441x.c
>>> +++ b/arch/m68k/coldfire/m5441x.c
>>> @@ -154,8 +154,8 @@ static struct clk * const enable_clks[] 
>>> __initconst = {
>>>          &__clk_0_23, /* dspi.0 */
>>>          &__clk_0_24, /* uart0 */
>>>          &__clk_0_25, /* uart1 */
>>> -       &__clk_0_26, /* uart2 */
>>>          &__clk_0_27, /* uart3 */
>>> +       &__clk_1_26, /* uart 6 */
>>>
>>>          &__clk_0_33, /* pit.1 */
>>>          &__clk_0_37, /* eport */
>>> @@ -171,6 +171,7 @@ static struct clk * const disable_clks[] 
>>> __initconst = {
>>>          &__clk_0_14, /* i2c.1 */
>>>          &__clk_0_22, /* i2c.0 */
>>>          &__clk_0_23, /* dspi.0 */
>>> +       &__clk_0_26, /* uart2 */
>>>          &__clk_0_28, /* tmr.1 */
>>>          &__clk_0_29, /* tmr.2 */
>>>          &__clk_0_30, /* tmr.2 */
>>> @@ -198,7 +199,6 @@ static struct clk * const disable_clks[] 
>>> __initconst = {
>>>          &__clk_1_7, /* i2c.5 */
>>>          &__clk_1_24, /* uart 4 */
>>>          &__clk_1_25, /* uart 5 */
>>> -       &__clk_1_26, /* uart 6 */
>>>          &__clk_1_27, /* uart 7 */
>>>          &__clk_1_28, /* uart 8 */
>>>          &__clk_1_29, /* uart 9 */
>>> @@ -234,7 +234,9 @@ static void __init m5441x_uarts_init(void)
>>>   {
>>>          __raw_writeb(0x0f, MCFGPIO_PAR_UART0);
>>>          __raw_writeb(0x00, MCFGPIO_PAR_UART1);
>>> -       __raw_writeb(0x00, MCFGPIO_PAR_UART2);
>>> +       /* TODO: Make it a dedicated file ! */
>>> +       /* UART6 is our console */
>>> +       __raw_writeb(0xaf, MCFGPIO_PAR_UART2);
>>>   }
>>>
>>>   static void __init m5441x_fec_init(void)
>>
>> I think you are going to need to get some raw UART trace in there to 
>> really
>> see where it is getting too. It is relatively easy to push characters out
>> a UART, see the drivers/tty/serial/mcf.c uart driver to see how.
>>
> 
> Thanks for this suggestion, it really helped me !
> Even if it is a very bad way to do it :-).
> 
> So, I basically did:
> +static void __init uart6_putc(const char c)
> +{
> +       /* MCFUART_BASE6 is the base address */
> +       int i;
> +       unsigned char __iomem *membase = (unsigned char __iomem 
> *)MCFUART_BASE6;
> +
> +       for (i = 0; (i < 0x10000); i++) {
> +               if (readb(membase + MCFUART_USR) & MCFUART_USR_TXREADY)
> +                       break;
> +       }
> +       writeb(c, membase + MCFUART_UTB);
> +       for (i = 0; (i < 0x10000); i++) {
> +               if (readb(membase + MCFUART_USR) & MCFUART_USR_TXREADY)
> +                       break;
> +       }
> +}
> +
> +static void __init uart6_console_write(struct console *co, const char 
> *s, unsigned int count)
> +{
> +       for (; (count); count--, s++) {
> +               uart6_putc(*s);
> +               if (*s == '\n')
> +                       uart6_putc('\r');
> +       }
> +}
> +
> +static struct console uart6_console = {
> +    .name   = "uart6",
> +    .write  = uart6_console_write,
> +    .flags  = CON_PRINTBUFFER,
> +    .index  = -1,
> +};
> 
> In the arch/m68k/coldfire/m5441x.c file and called 
> register_console(&uart6_console); in the config_BSP() function.
> 
> I can now see the messages ! And I can also say that when CONFIG_UBOOT 
> is activated, it does not even enter in the config_BSP() function !
> 
> When I unset it, I go really far, but I can see that the command line is 
> empty in the pr_notice call of start_kernel. This means that 
> saved_command_line is empty, but as I won't get it from uboot, it might 
> be expected :-).
> 
> I now need to get why the _init_sp does not have the proper value :-(.
> 

For the record, I found the issue, which is already corrected latest 
kernel by [1].

When I get into my kernel after u-boot jsr, the SP is [2].
I don't have any initrd, and it is deactivated in my defconfig now, but 
we still try to access the address, which is 0x00000000 !

I think this patch should probably be reported to the stable kernels too ?

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/m68k/kernel/uboot.c?h=v6.10-rc1&id=3b4497668f721513eb7287f6bb0c4d651759c7c4
[2]: https://pasteboard.co/nVEC0bjTS5Ke.png

Thanks,
JM
