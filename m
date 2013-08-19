From: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Mon, 19 Aug 2013 23:46:02 +0300
Message-ID: <5212840A.4080300@aalto.fi>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org>	<520D4AE3.6040801@aalto.fi>	<520E76FC.9040803@aalto.fi>	<11425cb5ec432e2fbb7b675052e8b33d@gmail.com>	<520F5F81.7090409@aalto.fi>	<52102BEC.7000006@gmail.com>	<CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com>	<52108CAF.1010700@gmail.com> <CAMuHMdWqNBjHKiDojPdjzuOV65QXzjeMX5VbtUvgU7VTP4iYFg@mail.gmail.com> <5211DBD8.5090801@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="------------050901000200000009060608"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx06.aalto.fi ([130.233.222.105]:38736 "EHLO mx06.aalto.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751121Ab3HSUqF (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 19 Aug 2013 16:46:05 -0400
In-Reply-To: <5211DBD8.5090801@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

--------------050901000200000009060608
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2013 11:48 AM, Michael Schmitz wrote:
> Geert,
>> On Sun, Aug 18, 2013 at 10:58 AM, Michael Schmitz 
>> <schmitzmic@gmail.com> wrote:
>>> I'll also need to check the command_block and command_block_dma 
>>> addresses -
>>> does the DMA require virtual or physical addresses?
>>
>> Physical, of course.
>
> :-) VDMA was invented a bit later ...
>
>
> I'll go check the usage of the DMA API calls again, but as the driver 
> seems to do DMA fine until the short transfer, that seems the most 
> likely cause. PIO for dma_count < 7 might be an option.
>
> I see transfers with esp_count=1 and dma_count=7 in the log - wonder 
> why that works but the short 2/2 byte case does not.
>
> Cheers,
>
>    Michael
>
I guess those two bytes have something to do with target 
(re)selection... There are two different ways of attempting to read 
these bytes in the code, one is reading them from the FIFO byte by byte, 
and the other way is to setup a DMA read (write from device). The two 
different schemes are used in two different functions, and I do not 
understand why one method would be preferred over the other when 
comparing these functions.

I think I managed to find these two bytes; They are not ready for DMA, 
but are sitting in the FIFO waiting to be read.
So the loop before the "IRQ2 timeout" is waiting for an interrupt that 
would tell that the DMA transfer has finished.
...

[13433.390000] ESP: Disconnecting tgt[1] tag[20:0]
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x97, 2 bytes in FIFO.
[13433.400000] ESP: intr sreg[97] seqreg[04] sreg2[00] ireg[0c]
[13433.400000] ESP: reconnect tag, zorro_esp_irq_pending(): ESP_STATUS = 
0x97, 0 bytes in FIFO.
[13433.400000] IRQ(0:10:97), zorro_esp: esp_count = 2,  dma_count = 2, 
addr = 0x7fa59000. Writing.
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in FIFO.
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in FIFO.
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in FIFO.
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in FIFO.
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in FIFO.
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in FIFO.
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in FIFO.
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in FIFO.
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in FIFO.
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in FIFO.
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in FIFO.
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in FIFO.
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in FIFO.
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in FIFO.
[13433.400000] zorro_esp_irq_pending(): ESP_STATUS = 0x17, 2 bytes in FIFO.
...
Remember that write is read :)

Now, I guess, I have to check whether those two bytes contain the right 
information...

-Tuomas

--------------050901000200000009060608
Content-Type: application/x-gzip; name="zesp014.cap.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="zesp014.cap.gz"

H4sICD1/ElIAA3plc3AwMTQuY2FwAO2dbW/byBHH3wb5FAv0jQPYKh9kiRQQoEpiX402udzJ
aV8IhkFLlCrUknwijd7lRT97l5JF8UEz2llvD2jxFxxDsTg/zQ53/7skh8O3m/U6/1OyXMyT
wb//oK6/ffzLG/3aLJfrqUqzp4tski3evLy+rzeb9YX+6/4Pb5pb7F7a9mmzfkgVbVCw76fp
w/P8vffrTL+Gv/9XPmba6g3d3N3rsFX5HSTxbT2apw3+W/F+O/bDbhB1wsjTr7vdB/f6g4H6
8Lj4/j3ZTJUfhJ6arZ9XU5XkKplON2mWKe/XNClsOiUibiEW62Jr9X67cfEN52q6TA5/e6gB
uv4OsDXVv/TWm3SejSNvZzzQbx52myw2v4yDu9IwbBiqRaYSdT0cBWHvXHU99fnP39XZZDJ7
7707V6OPoxt180n1S/vLhuf3mn//lK6mi9X87N1AXY2+3o9uh7ffRlu/tWOeevgtTzO1WKnr
m+sfD23ouUP13aGae9cWFXe2oXaE8t2gQq8TOIpVgXIUq9Dv+KE7VNcZat/bC3noqe2AKT96
CaOGDVQ+z8f6/ePzavyy9f1kOVVjrQfK815+gm7x+64JqGhA4etEi0eu/eqfq0IAyv/7enSW
atCfJZeFhHTUz2lSNKv0uC/sKBHT+j1r28TFKt+oTIuM1hjdxPSX4u02NvpNMN4pjf5T4JUt
7AfOdkTfXffodxs7zhfuuH6zf7nZcUI1jH2mib2jOy72uR3nR3dH7bM82eRqmuTJthnj/iyO
vOlD0d3T1Tjs3al/bRZ5eua/I5tSD1Axz9QiFNYjtMN31N81thYhoXD5XISEyhWHp1nNaIeH
aHfb0a4Mk6r9Ns7T9SpVs0c9n2/32Covwmztuu6QgdD1Pue6F9n7wo1LwheP8yUgwvhxvVwm
ehG2jaTuwflzVgzwpV6NJfN0XLFqrsROdSqmBZFwvmdZgVSlel5NpaKm+DpRqUg4t3IqFXWP
73CfHTeHzlez51UqPqJSrabUAxQ3VSo2U6lIuEDWAfKpAEmnBEakImJKMBWpmj0hUnGvtbkL
kaJcNxUpsS/csCR8MRWpmr2xSEXSmY9rgVCyWVZ8WB6r3sAb+Pqf+qQbPckvhpNJcexbvEbD
z6NvX37Qb776gR9+UeXr9q++p77+NNBfMfwyuhmoYM+OvQpbD+55mu++QX1I54vVSnurPq2X
ifbpb8njQnfJxXpVGldXrjbqGTeX0Q1xsFPPWLiK5dRzz7JVz5p9Wz0f4sn2Y0o9W02RqecO
31bPWDi/FOrZoyIkV2Iy2A6VOH6lEscyJRa7zigx5bqpEot9YbSH8sVUiWMrJY4dKnEcv1ak
2mcRXy1SQccTrmJ7VAs1Sngywg8YlvBkAq2dB5addjbsj2tnj9TOI02Ra2evpZ0aK5xdyJWn
RkmX+aTeHVh2etewP6V3Fq6Teke7bqZ3Fr6QakH7YqZ3DXtDvdNW0jmUa4FQ/TmWX1VvuXYe
AG6105eeD2FEyifOh5iKVM1eLlKtprgRKV96voUWqUA4UXEitWfZilTN/rRIiV1nRIpy3VSk
xL4ww5LyxVSkavbGIhVIlxlcC4TLDJZVPcSyEangxEGWnUgFQk3nRGrPshWpmr1cpFpNcSNS
gXSmIo9CA/HlVk7wnF20OLCsBc/gokVV8JxdtKBdNxY8ZxctaF+MBc/iooW2cnbRIiiTFKxF
qpXlUB+Dvp1ISRMeYuYwNDx+HbsQFCORqtmPdi7s94qOTbALjK+8sPjtx8qbqZax4XWYvll0
hLMUFxzhUWOPHpihxaEX6dbpQy+f0ycbXyjdtfKlIjg1+x/WuVpmc/0dxZcpv9zI4jwdGbzT
5+n44Fn4QgbPxpdq8Hp08MJyI+Ekywav/8rgWfhCBs/Gl2rw+iY9z2JuJoN3em7mg2fhCxk8
G1+qwYuY4MXlVsK5mI1e/MroWfhCRs/Gl2r0Yjp6s+ZG7Yt818PR7YXv7RJQfa/jqc8f/pip
0a060xOqWmXnaj2bZWmu/MvycKArPZRlzjfvWc32B4b7ouVLfd5vHpkYLoukLTRoIFBAAQUU
UEABBRRQQAEFFFBAAQUUUEABBRRQQAEFFFBAAQXU/z5KmGLGoYT5WAF93b3r7B7RA6t5Dds3
vYZ9+h5RLju31RQ32bldi3tEqQBJU6GZjNoukQodmga7an86o1bsOpNRS7lumush9oXJR6V8
8ThfAiKMxhm10lpkXEattBgZy3J2t35Q1s+5ss30bRXgcXI7grQCCyd4fSJpiRe8Q0eu2csF
r9UUN4InritDByiSplUzghcRadWmtxDU7E8Lnth1RvAo101vIRD7wgxLyheP8yUgwmgseK3y
QK8QllohHhthOVWKx05YxHVfuHFzuqIaewtBxFdUOyUsraY4EhaLe5MuqQhJZypmdEpnBE6k
iBnBWKSq9gYiZZGBeyoM1iIl9YUb4oQvxiJVtTcWqX0NIBcita/o0041blURUtk/F09P+it2
41BpXJ6VnIDiXG3doooSBWVtm2x6qJU0zPNk8o90usPN01W6WUxUNvdU/ttTqrzS1uF9+NIq
LCyrmiNfSH8gKqZ5ABDKZlWmLuz4riqPhu4K04biwrR0bdYDqzEgI7MB2bAn5+xyr5U/LYDL
OVtTpf2cPCkTtks8WE8jYb3exPFpxKPnfwtfyHmB9sVsXrDwheuGr6rC1LA/Ni8E7XnhYKV9
L+rNrQvZTZ7z9YWejjM9Oa839S5NttyN2AjjSd6MCRRQQAEFFFBAAQUUUEABBRRQQAEFFFBA
AQUUUEABBRRQQAH1/4QSZqRxKGlCGpdK4CxH+cBqXjI3SyVs2B957OGke5l4VCrhkaYIH3u4
xTdTCUPxUwSYAEnL+UdM3kZAPMLYLP2vYd9I/7t8Sf+r7Bux60yaB+W6aZqH2BcmzYPyxTTN
I7DIUT5Y7dI86klKw2+3P6rR1ZfR1Vj1d8lJvXquUlL7bxCTmUzSRz5wcXKXLCZ9SgOHEuoz
h3L18PjQ3cPjQ3E9fAbVqmb/CpRwAHKo5pNEQlGaZdiu8u4k80laZJ1robvuLq1ezqGE3Z3T
UKKWt7GGhka3bzEZm63GOMnYlFbs5pZZ7mpphyb1qz1umeWulraRL+xUztXS7lo7zPVVmzVq
ta9W7T8tssl6tUonxYJx33PzpDAYHEzEtbuZpRNVu5uP96Tly9Z+k754X/h87qRv7vk3P/90
5g18bxD3351T4zJojMvg6LBsrsel4fQNwgkWWGCBBRZYYIEFFlhggQUWWGCBBRZYYIEFFlhg
gQUWWGCBBRZYYIEFFlhggQUWWGCBBRZYYIEFFlhggQUWWGCBBRZYYIEFFlhggQUWWGCBBRZY
YIEFFlhggQUWWGCBBRZYYIEFFlhggQUWWGCBBRZYYIEFFlhggQUWWGCBBRZYYIEFFlhggQUW
WGCBBRZYYIEFFlhggQUWWGCBBRZYYIEFFlhggQUWWGCBBRZYYIEFFlhggQUWWGCBBRZYYIEF
FlhggQUWWGCBBRZYYIEFFlhggQUWWGCBBRZYYIEFFlhggQUWWGCBBRZYYIEFFlhggQUWWGCB
BRZYYIEFFlhg/a6s/wB3LkDT21cBAA==
--------------050901000200000009060608--
